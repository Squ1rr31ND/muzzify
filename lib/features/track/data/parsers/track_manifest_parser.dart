import 'package:xml/xml.dart';

abstract final class TrackManifestParser {
  static String buildDownloadUrl(String manifestXml) {
    final document = XmlDocument.parse(manifestXml);

    final downloadInfo = document.findElements('download-info').firstOrNull;
    if (downloadInfo == null) {
      throw const FormatException('Missing "download-info" in manifest');
    }

    final host = downloadInfo.findElements('host').firstOrNull?.innerText;
    if (host == null) throw const FormatException('Missing "host" in manifest');

    final path = downloadInfo.findElements('path').firstOrNull?.innerText;
    if (path == null) throw const FormatException('Missing "path" in manifest');

    final ts = downloadInfo.findElements('ts').firstOrNull?.innerText;
    if (ts == null) throw const FormatException('Missing "ts" in manifest');

    return 'https://$host/get-mp3/0/$ts$path';
  }
}
