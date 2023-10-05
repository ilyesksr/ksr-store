import 'package:flutter/material.dart';
import 'package:ksr_store_app/res/colors.dart';

abstract class MyTheme {
  static ThemeData getTheme(bool isDark) {
    return isDark ? darkTheme() : lightTheme();
  }

  static ThemeData lightTheme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: cPrimaryColor);
  }

  static ThemeData darkTheme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: cPrimaryColor,
        brightness: Brightness.dark);
  }
}
