import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class MuzzifyApp extends StatelessWidget {
  const MuzzifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muzzify',
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.themeMode,
    );
  }
}
