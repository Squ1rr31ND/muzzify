import 'package:flutter/material.dart';

import 'themes/themes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.theme,
      darkTheme: Themes.darkTheme,
      themeMode: Themes.themeMode,
    );
  }
}
