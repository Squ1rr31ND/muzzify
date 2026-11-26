import 'package:flutter_bloc/flutter_bloc.dart';

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
      final result = await _repository.search(query, page: 0);
      final tracks = result.tracks;

      if (tracks.isEmpty) {
        emit(const SearchEmpty());
        return;
      }

      emit(
        SearchLoaded(
          query: query,
          tracks: tracks,
          hasReachedMax: result.isLastResult,
        ),
      );
    } catch (_) {
      emit(SearchFailure(query: query));
    }
  }

  Future<void> loadMore() async {
    final state = this.state;

    if (state is! SearchLoaded) return;
    if (state.hasReachedMax) return;
    if (state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true, hasError: false));

    try {
      final nextPageResult = await _repository.search(
        state.query,
        page: state.currentPage + 1,
      );

      emit(
        state.copyWith(
          tracks: [...state.tracks, ...nextPageResult.tracks],
          currentPage: state.currentPage + 1,
          isLoadingMore: false,
          hasReachedMax: nextPageResult.isLastResult,
          hasError: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isLoadingMore: false, hasError: true));
    }
  }
}
