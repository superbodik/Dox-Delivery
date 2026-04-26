import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF0A0A12);
  static const Color cardColor = Color(0xFF161625);
  static const Color accent = Colors.deepPurpleAccent;

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: accent,
    cardTheme: const CardThemeData(
      color: cardColor,
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      centerTitle: true,
    ),
  );
}