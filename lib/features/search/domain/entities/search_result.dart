import '../../../track/domain/entities/track.dart';

final class SearchResult {
  final List<Track> tracks;
  final bool isLastResult;

  const SearchResult({required this.tracks, required this.isLastResult});
}
