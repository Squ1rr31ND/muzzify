class NetworkConstants {
  static const String baseUrl = 'https://api.music.yandex.net';

  static const Map<String, String> headers = {
    'x-yandex-music-client': 'YandexMusic/0',
  };

  static const Duration connectTimeout = Duration(seconds: 5);

  static const Duration receiveTimeout = Duration(seconds: 10);
}
