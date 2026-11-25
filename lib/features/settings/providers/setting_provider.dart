import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  String languagecode = 'en';

bool get isDarkMode => theme == ThemeMode.dark;
  void changeTheme(ThemeMode newTheme) {
    theme = newTheme;
    notifyListeners();
  }

  void changeLanguage(String language) {
    if (language == languagecode) return; // No change, do nothing
    languagecode = language;
    notifyListeners();
  }
}