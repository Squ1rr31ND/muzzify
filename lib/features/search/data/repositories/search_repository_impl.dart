import '../../../../shared/domain/entities/track.dart';
import '../../domain/repositories/search_repository.dart';
import '../api/search_api.dart';

final class SearchRepositoryImpl implements SearchRepository {
  final SearchApi _api;

  const SearchRepositoryImpl({required this._api});

  @override
  Future<List<Track>> search(String query, {int page = 0}) async {
    final trackModels = await _api.search(query, page: page);
    return trackModels.map((model) => model.toEntity()).toList();
  }
}
