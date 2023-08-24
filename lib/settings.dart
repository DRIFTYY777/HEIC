import 'package:flutter/material.dart';
import 'package:heif/settingsManager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Settings extends HookConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final settings = ref.watch(settingsManagerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Image Format:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: settings.selectedFormat,
              onChanged: (value) {
                settings.selectedFormat = value!;
                settings.updateSettings();
              },
              items: ['jpeg', 'png', 'heic', 'webp']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Image Quality:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: settings.quality,
              onChanged: (value) {
                settings.quality = value;
                settings.updateSettings();
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: settings.quality.round().toString(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Image Dimensions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Checkbox(
                  value: settings.autoHeight,
                  onChanged: (value) {
                    settings.autoHeight = value!;
                    settings.updateSettings();
                  },
                ),
                const Text('Auto Height'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: settings.autoWidth,
                  onChanged: (value) {
                    settings.autoWidth = value!;
                    settings.updateSettings();
                  },
                ),
                const Text('Auto Width'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Image Rotation:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: settings.rotateAngle,
              onChanged: (value) {
                settings.rotateAngle = value;
                settings.updateSettings();
              },
              min: 0,
              max: 360,
              divisions: 36,
              label: '${settings.rotateAngle.round()}°',
            ),
            const SizedBox(height: 16),
            const Text(
              'Image Processing:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Checkbox(
                  value: settings.autoCorrectionAngle,
                  onChanged: (value) {
                    settings.autoCorrectionAngle = value!;
                    settings.updateSettings();
                  },
                ),
                const Text('Auto Correction Angle'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: settings.keepExif,
                  onChanged: (value) {
                    settings.keepExif = value!;
                    settings.updateSettings();
                  },
                ),
                const Text('Keep EXIF Data'),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  settings.saveSettings();
                },
                child: const Text('Save Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
