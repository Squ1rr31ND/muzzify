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
      final tracks = await _repository.search(query);

      if (tracks.isEmpty) {
        emit(const SearchEmpty());
        return;
      }

      emit(SearchLoaded(tracks));
    } catch (_) {
      emit(const SearchFailure());
    }
  }
}
