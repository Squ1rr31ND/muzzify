import '../../../../shared/domain/entities/track.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {
  const SearchInitial();
}

final class SearchLoading extends SearchState {
  const SearchLoading();
}

final class SearchLoaded extends SearchState {
  final String query;
  final List<Track> tracks;

  const SearchLoaded({required this.query, required this.tracks});
}

final class SearchEmpty extends SearchState {
  const SearchEmpty();
}

final class SearchFailure extends SearchState {
  const SearchFailure();
}
