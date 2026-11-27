import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, this.children = const []});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                AppConstants.appName,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
