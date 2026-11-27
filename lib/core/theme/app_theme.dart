import 'package:flutter/material.dart';

class AppTheme {
  static const MaterialColor _seedColor = Colors.yellow;
  static const AppBarTheme _appBarTheme = AppBarTheme(
    shadowColor: Colors.black,
    centerTitle: true,
  );

  static final ThemeData theme = ThemeData(
    colorSchemeSeed: _seedColor,
    appBarTheme: _appBarTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
      surface: Colors.black,
    ),
    appBarTheme: _appBarTheme,
  );

  static const ThemeMode themeMode = ThemeMode.system;
}
