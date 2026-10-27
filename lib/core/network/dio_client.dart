import 'package:dio/dio.dart';

final class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.music.yandex.net',
          headers: {'x-yandex-music-client': 'YandexMusic/0'},
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );
}
