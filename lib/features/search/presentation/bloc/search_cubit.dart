import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/search_api.dart';
import '../../domain/repositories/search_repository.dart';
import 'search_state.dart';

final class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _repository;

  SearchCubit({required this._repository}) : super(const SearchInitial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(const SearchInitial());
      return;
    }

    emit(const SearchLoading());

    try {
      final tracks = await _repository.search(query);

      if (tracks.isEmpty) {
        emit(const SearchEmpty());
        return;
      }

      emit(SearchLoaded(query: query, tracks: tracks));
    } catch (_) {
      emit(const SearchFailure());
    }
  }

  Future<void> loadMore() async {
    final state = this.state;

    if (state is! SearchLoaded) return;
    if (state.hasReachedMax) return;
    if (state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true, hasError: false));

    try {
      final nextPageTracks = await _repository.search(
        state.query,
        page: state.currentPage + 1,
      );

      final hasReachedMax = nextPageTracks.length < SearchApi.pageSize;

      emit(
        state.copyWith(
          tracks: [...state.tracks, ...nextPageTracks],
          currentPage: state.currentPage + 1,
          isLoadingMore: false,
          hasReachedMax: hasReachedMax,
          hasError: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isLoadingMore: false, hasError: true));
    }
  }
}
