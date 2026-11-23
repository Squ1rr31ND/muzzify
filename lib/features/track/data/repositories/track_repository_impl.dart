import '../../domain/repositories/track_repository.dart';
import '../api/track_api.dart';
import '../parsers/track_manifest_parser.dart';

class TrackRepositoryImpl implements TrackRepository {
  final TrackApi _api;

  const TrackRepositoryImpl({required this._api});

  @override
  Future<String> getDownloadUrl(int trackId) async {
    final infoUrl = await _api.fetchDownloadInfoUrl(trackId);
    final xml = await _api.fetchManifestXml(infoUrl);
    return TrackManifestParser.buildDownloadUrl(xml);
  }
}
