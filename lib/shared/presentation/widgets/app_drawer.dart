import 'package:material_ui/material_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/constants/app_constants.dart';
import '../../extensions/build_context_extensions.dart';
import '../../utils/open_url.dart';
import 'app_icon.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, this.children = const []});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                AppConstants.appName,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ...[
            if (children.isNotEmpty) ...[...children, const Divider()],
            ListTile(
              leading: const Icon(Icons.code),
              title: Text(context.l10n.sourceCode),
              onTap: () => openUrl(AppConstants.repositoryUrl),
            ),
            const Divider(),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                return AboutListTile(
                  icon: const Icon(Icons.info_outlined),
                  applicationVersion: snapshot.data?.version ?? '',
                  applicationIcon: const AppIcon(size: 96.0),
                  applicationLegalese: context.l10n.aboutCopyrightText,
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
