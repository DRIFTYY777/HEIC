// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:heif/settings.dart';
import 'package:heif/settingsManager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_scanner/media_scanner.dart';
import 'dart:ui' as ui;

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

eatItSnackBar(context, String message) {
  var snackBar = SnackBar(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    dismissDirection: DismissDirection.startToEnd,
    backgroundColor: const Color.fromARGB(213, 5, 5, 5),
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    content: Text(
      message,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 16,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HEIC Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'HEIC Converter'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  List<File>? path;
  bool loading = false;

  Future<void> convertHeicToPng(
      List<File>? inputPaths, String outputPath) async {
    setState(() {
      loading = true;
    });
    try {
      for (var i = 0; i < inputPaths!.length; i++) {
        final File inputPath = inputPaths[i];
        final Uint8List bytes = await inputPath.readAsBytes();
        final ui.Image image = await decodeImageFromList(bytes);

        CompressFormat format = CompressFormat.jpeg;
        String selectedFormat =
            ref.read(settingsManagerProvider).selectedFormat;
        if (selectedFormat == 'jpeg') {
          format = CompressFormat.jpeg;
        } else if (selectedFormat == 'png') {
          format = CompressFormat.png;
        } else if (selectedFormat == 'heic') {
          format = CompressFormat.heic;
        } else if (selectedFormat == 'webp') {
          format = CompressFormat.webp;
        }

        String newPath =
            "$outputPath/${inputPath.path.toLowerCase().split("/").last.replaceAll("heic", format.toString()).replaceAll('.CompressFormat', '')}";

        Uint8List heicBytes = await inputPath.readAsBytes();

        Uint8List jpgBytes = await FlutterImageCompress.compressWithList(
            heicBytes,
            minHeight: image.height,
            minWidth: image.width,
            inSampleSize: 0,
            quality: ref.read(settingsManagerProvider).quality.toInt(),
            rotate: ref.read(settingsManagerProvider).rotateAngle.toInt(),
            autoCorrectionAngle:
                ref.read(settingsManagerProvider).autoCorrectionAngle,
            format: format,
            keepExif: ref.read(settingsManagerProvider).keepExif);
        debugPrint("New path: $newPath");

        File jpgFile;
        try {
          jpgFile = File(newPath);
          await jpgFile.writeAsBytes(jpgBytes);
        } catch (e) {
          eatItSnackBar(context, "Faileddddd $e");
          debugPrint(e.toString());
        }

        eatItSnackBar(context, "Successful Done!, Saved in Gallery");
        MediaScanner.loadMedia(path: newPath.toString()); // could be error
      }
    } catch (e) {
      eatItSnackBar(context, "Failed $e");
      debugPrint(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  // ignore: non_constant_identifier_names
  Future<List<File>?> _get_file_path() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, withData: true, withReadStream: true);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      return null;
    }
  }

  String pathProvider() {
    String savingPath;
    var camera = '/storage/emulated/0/DCIM/Camera';
    var screenShot = '/storage/emulated/0/DCIM/Screenshots';
    var pictures = '/storage/emulated/0/Pictures';
    var download = '/storage/emulated/0/Download';
    if (Directory(camera).existsSync()) {
      savingPath = camera;
    } else if (Directory(screenShot).existsSync()) {
      savingPath = screenShot;
    } else if (Directory(pictures).existsSync()) {
      savingPath = pictures;
    } else if (Directory(download).existsSync()) {
      savingPath = download;
    } else {
      savingPath = '/storage/emulated/0';
    }
    return savingPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: loading
                        ? null
                        : () async {
                            path = await _get_file_path();
                            convertHeicToPng(path, pathProvider());
                            setState(() {});
                          },
                    child: const Text("Select Image"),
                  ),
          ],
        ),
      ),
      floatingActionButton: !loading
          ? FloatingActionButton(
              onPressed: () {
                // Navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
              child: const Icon(
                Icons.settings,
              ),
            )
          : null, // Set to null to hide the button
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
