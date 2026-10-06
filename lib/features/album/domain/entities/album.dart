import '../../../track/domain/entities/track.dart';

final class Album {
  final String id;
  final String? title;
  final List<String> artistNames;
  final String? coverImageUrl;
  final List<Track> tracks;

  const Album({
    required this.id,
    this.title,
    this.artistNames = const [],
    this.coverImageUrl,
    this.tracks = const [],
  });
}
