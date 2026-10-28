import 'package:dio/dio.dart';

import '../../../../shared/data/models/track_model.dart';

final class SearchApi {
  static const String _searchEndpoint = '/search';
  static const int _pageSize = 36;

  final Dio _dio;

  const SearchApi({required this._dio});

  Future<List<TrackModel>> search(String query, {required int page}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      _searchEndpoint,
      queryParameters: {
        'text': query,
        'type': 'track',
        'page': page,
        'pageSize': _pageSize,
      },
    );

    final json = response.data;

    if (json == null) {
      throw const FormatException('Response data is null');
    }

    final result = json['result'] as Map<String, dynamic>?;

    if (result == null) {
      throw const FormatException('Missing "result" in response');
    }

    final tracks = result['tracks'] as Map<String, dynamic>?;

    if (tracks == null) {
      throw const FormatException('Missing "tracks" in response');
    }

    final results = tracks['results'] as List<dynamic>?;

    if (results == null) {
      throw const FormatException('Missing "results" in response');
    }

    return results
        .map((e) => TrackModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }
}
