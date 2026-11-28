import 'package:url_launcher/url_launcher_string.dart';

Future<bool> openUrl(String url) =>
    launchUrlString(url, mode: LaunchMode.externalApplication);
