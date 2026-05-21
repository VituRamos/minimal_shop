import 'package:flutter/material.dart';

//Light Theme
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade50,
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    tertiary: Color(0xFF059669),
    inversePrimary: Colors.grey.shade700,
  ),
);

//Dark Theme
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    tertiary: Color(0xFF10B981),
    inversePrimary: Colors.grey.shade300,
  ),
);
