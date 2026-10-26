import '../../../../shared/domain/entities/track.dart';

abstract interface class SearchRepository {
  Future<List<Track>> search(String query, {int page = 0});
}
