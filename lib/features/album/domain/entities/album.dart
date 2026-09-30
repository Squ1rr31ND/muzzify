import '../../../track/domain/entities/track.dart';

final class Album {
  final String id;
  final String? title;
  final List<String> artists;
  final String? coverImageUrl;
  final List<Track> tracks;

  const Album({
    required this.id,
    this.title,
    this.artists = const [],
    this.coverImageUrl,
    this.tracks = const [],
  });
}
