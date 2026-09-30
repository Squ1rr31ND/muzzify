import 'package:dio/dio.dart';

class AlbumApi {
  final Dio _dio;

  const AlbumApi({required this._dio});

  Future<Response> fetchAlbumById(int albumId) =>
      _dio.get('/albums/$albumId/with-tracks');
}
