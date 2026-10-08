import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode _theme = ThemeMode.dark;
  String languagecode = 'en';

  ThemeMode get theme => _theme;

  bool get isDarkMode => _theme == ThemeMode.dark;

  void changeTheme(ThemeMode newTheme) {
    if (_theme == newTheme) return;
    _theme = newTheme;
    notifyListeners();
  }

  void changeLanguage(String language) {
    if (language == languagecode) return; // No change, do nothing
    languagecode = language;
    notifyListeners();
  }
}