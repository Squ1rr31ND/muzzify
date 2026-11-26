abstract final class AuthConstants {
  static const String host = 'oauth.yandex.ru';
  static const String path = '/authorize';
  static const String clientID = '23cabbbdc6cd418abb4b39c32c41195d';
  static const String responseType = 'token';
  static const String accessTokenKey = 'access_token';

  static Uri get authorizeUri => Uri.https(host, path, {
    'response_type': responseType,
    'client_id': clientID,
  });
}
