import 'package:flutter/material.dart';

class Themes {
  static const Color _seedColor = Colors.yellow;

  static const AppBarThemeData _appBarTheme = AppBarThemeData(
    centerTitle: true,
  );

  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
    appBarTheme: _appBarTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: _appBarTheme,
  );

  static const ThemeMode themeMode = ThemeMode.system;
}
