import 'package:dio/dio.dart';

import '../constants/network_constants.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: NetworkConstants.baseUrl,
          headers: NetworkConstants.headers,
          connectTimeout: NetworkConstants.connectTimeout,
          receiveTimeout: NetworkConstants.receiveTimeout,
        ),
      );
}
