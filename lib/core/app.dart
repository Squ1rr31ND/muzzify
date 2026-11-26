import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

class MuzzifyApp extends StatelessWidget {
  const MuzzifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Muzzify',
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
