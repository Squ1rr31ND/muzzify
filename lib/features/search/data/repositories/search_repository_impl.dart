import '../../domain/entities/search_result.dart';
import '../../domain/repositories/search_repository.dart';
import '../api/search_api.dart';

final class SearchRepositoryImpl implements SearchRepository {
  final SearchApi _api;

  const SearchRepositoryImpl({required this._api});

  @override
  Future<SearchResult> search(String query, {int page = 0}) async {
    final trackModels = await _api.search(query, page: page);
    final tracks = trackModels.map((model) => model.toEntity()).toList();
    final isLastResult = tracks.length < SearchApi.pageSize;
    return SearchResult(tracks: tracks, isLastResult: isLastResult);
  }
}
