import 'package:webview_flutter/webview_flutter.dart';

import 'cookie_storage.dart';

final class CookieStorageImpl implements CookieStorage {
  final WebViewCookieManager _cookieManager;

  const CookieStorageImpl({required this._cookieManager});

  @override
  Future<void> clearCookies() => _cookieManager.clearCookies();
}
