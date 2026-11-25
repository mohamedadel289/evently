import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.dark;

bool get isDarkMode => theme == ThemeMode.dark;
  void changeTheme(ThemeMode newTheme) {
    theme = newTheme;
    notifyListeners();
  }
}