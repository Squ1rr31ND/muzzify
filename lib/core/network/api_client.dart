import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  const ApiClient({required this._dio});

  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(path, data: data, queryParameters: queryParameters);
  }
}
