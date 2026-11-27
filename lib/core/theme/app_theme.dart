import 'package:material_ui/material_ui.dart';

import '../colors/app_colors.dart';

class AppTheme {
  static const AppBarTheme _appBarTheme = AppBarTheme(
    shadowColor: AppColors.appBarShadow,
    centerTitle: true,
  );

  static final ThemeData theme = ThemeData(
    colorSchemeSeed: AppColors.appSeed,
    appBarTheme: _appBarTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.appSeed,
      brightness: Brightness.dark,
      surface: AppColors.darkSurface,
    ),
    appBarTheme: _appBarTheme,
  );

  static const ThemeMode themeMode = ThemeMode.system;
}
