import 'package:dio/dio.dart';

class TrackApi {
  final Dio _dio;

  const TrackApi({required this._dio});

  Future<Response> fetchTracksByIds(List<String> trackIds) {
    final String plainTrackIds = trackIds.join(',');
    final Map<String, dynamic> queryParameters = {'track_ids': plainTrackIds};
    return _dio.get('/tracks', queryParameters: queryParameters);
  }
}
