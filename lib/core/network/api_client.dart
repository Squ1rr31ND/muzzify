import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  const ApiClient({required this.dio});

  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(path, data: data, queryParameters: queryParameters);
  }
}
