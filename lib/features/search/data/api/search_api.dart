import 'package:dio/dio.dart';

class SearchApi {
  static const String _searchEndpoint = '/search/instant/mixed';
  static const String _searchType = 'track,album';
  static const int _pageSize = 36;

  final Dio _dio;

  const SearchApi({required this._dio});

  Future<Response> search(String query, {required int page}) {
    return _dio.get(
      _searchEndpoint,
      queryParameters: {
        'text': query,
        'type': _searchType,
        'page': page,
        'pageSize': _pageSize,
      },
    );
  }
}
