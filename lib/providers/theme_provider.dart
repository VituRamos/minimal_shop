import 'package:flutter/material.dart';
import '../theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  //Default
  ThemeData _themeData = lightMode;

  //Get Theme
  ThemeData get themeData => _themeData;

  //IsDarkMode
  bool get isDarkMode => _themeData == darkMode;

  //Set Theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //Toggle Theme
  void toggleTheme() {
    _themeData = (_themeData == lightMode) ? darkMode : lightMode;
    notifyListeners();
  }
}
