import 'package:flutter/material.dart';

import 'navigation/navigation.dart';
import 'themes/themes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Muzzify',
      theme: Themes.theme,
      darkTheme: Themes.darkTheme,
      themeMode: Themes.themeMode,
      routerConfig: Navigation.router,
    );
  }
}
