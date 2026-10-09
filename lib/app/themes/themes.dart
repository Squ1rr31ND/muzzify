import 'package:flutter/material.dart';

class Themes {
  static const Color _seedColor = Colors.yellow;

  static final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
  );

  static const ThemeMode themeMode = ThemeMode.system;
}
