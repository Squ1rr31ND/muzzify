import 'package:material_ui/material_ui.dart';

import '../../../core/constants/app_constants.dart';
import '../../extensions/build_context_extensions.dart';

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
          ...[
            if (children.isNotEmpty) ...[...children, Divider()],
            AboutListTile(
              icon: Icon(Icons.info_outlined),
              applicationLegalese: context.l10n.aboutCopyrightText,
            ),
          ],
        ],
      ),
    );
  }
}
