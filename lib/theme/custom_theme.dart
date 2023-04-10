import 'package:flutter/material.dart';

class CustomTheme{
  static Color primary = Colors.orange.shade400;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary
    )
  );
}