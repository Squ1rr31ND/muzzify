import 'package:dio/dio.dart';

final class TrackApi {
  final Dio _dio;

  const TrackApi({required this._dio});

  Future<String> fetchDownloadInfoUrl(int trackId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tracks/$trackId/download-info',
    );

    final json = response.data;
    if (json == null) throw const FormatException('Response data is null');

    final result = json['result'] as List<dynamic>?;
    if (result == null || result.isEmpty) {
      throw const FormatException('Missing "result" in response');
    }

    final item = result[0];
    if (item is! Map<String, dynamic>) {
      throw const FormatException('Invalid "result" item');
    }

    final downloadInfoUrl = item['downloadInfoUrl'] as String?;
    if (downloadInfoUrl == null) {
      throw const FormatException('Missing "downloadInfoUrl" in response');
    }

    return downloadInfoUrl;
  }

  Future<String> fetchManifestXml(String infoUrl) async {
    final response = await _dio.get<String>(
      infoUrl,
      options: Options(responseType: ResponseType.plain),
    );

    final data = response.data;
    if (data == null) throw const FormatException('Missing "data" in response');

    return data;
  }
}
