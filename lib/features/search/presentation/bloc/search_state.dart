import '../../../track/domain/entities/track.dart';

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
  final int currentPage;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final bool hasError;

  const SearchLoaded({
    required this.query,
    required this.tracks,
    this.currentPage = 0,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.hasError = false,
  });

  SearchLoaded copyWith({
    List<Track>? tracks,
    int? currentPage,
    bool? isLoadingMore,
    bool? hasReachedMax,
    bool? hasError,
  }) {
    return SearchLoaded(
      query: query,
      tracks: tracks ?? this.tracks,
      currentPage: currentPage ?? this.currentPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      hasError: hasError ?? this.hasError,
    );
  }
}

final class SearchEmpty extends SearchState {
  const SearchEmpty();
}

final class SearchFailure extends SearchState {
  final String query;

  const SearchFailure({required this.query});
}
