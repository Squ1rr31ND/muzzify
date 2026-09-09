import 'package:dio/dio.dart';

import '../constants/network_constants.dart';

class DioClient {
  final Dio dio;

  DioClient({List<Interceptor> interceptors = const []})
    : dio = Dio(
        BaseOptions(
          baseUrl: NetworkConstants.baseUrl,
          headers: NetworkConstants.headers,
          connectTimeout: NetworkConstants.connectTimeout,
          receiveTimeout: NetworkConstants.receiveTimeout,
        ),
      ) {
    dio.interceptors.addAll(interceptors);
  }
}
