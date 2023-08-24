import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsManagerProvider =
    ChangeNotifierProvider<SettingsManager>((ref) => SettingsManager());

class SettingsManager extends ChangeNotifier {
  SettingsManager() {
    loadSettings();
    notifyListeners();
  }

  void updateSettings() {
    notifyListeners();
  }

  String selectedFormat = 'jpeg';
  double quality = 100;
  bool autoHeight = true;
  bool autoWidth = true;
  double rotateAngle = 0;
  bool autoCorrectionAngle = false;
  bool keepExif = false;

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedFormat = prefs.getString('selectedFormat') ?? 'jpeg';
    quality = prefs.getDouble('quality') ?? 100;
    autoHeight = prefs.getBool('autoHeight') ?? true;
    autoWidth = prefs.getBool('autoWidth') ?? true;
    rotateAngle = prefs.getDouble('rotateAngle') ?? 0;
    autoCorrectionAngle = prefs.getBool('autoCorrectionAngle') ?? false;
    keepExif = prefs.getBool('keepExif') ?? false;
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedFormat', selectedFormat);
    prefs.setDouble('quality', quality);
    prefs.setBool('autoHeight', autoHeight);
    prefs.setBool('autoWidth', autoWidth);
    prefs.setDouble('rotateAngle', rotateAngle);
    prefs.setBool('autoCorrectionAngle', autoCorrectionAngle);
    prefs.setBool('keepExif', keepExif);
  }
}
