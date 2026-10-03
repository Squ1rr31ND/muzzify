import 'package:dio/dio.dart';

class TrackApi {
  static const String _tracksEndpoint = '/tracks';

  final Dio _dio;

  const TrackApi({required this._dio});

  Future<Response> fetchTracksByIds(List<String> trackIds) {
    return _dio.get(
      _tracksEndpoint,
      queryParameters: {'track_ids': trackIds.join(',')},
    );
  }
}
