import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  //Default
  ThemeMode _themeMode = ThemeMode.light;

  //Get Theme
  ThemeMode get themeMode => _themeMode;

  //IsDarkMode
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  //Set Theme
  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  //Toggle Theme
  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
