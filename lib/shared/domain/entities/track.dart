import 'artist.dart';

final class Track {
  final int id;
  final String title;
  final Duration duration;
  final List<Artist> artists;
  final String? coverUrl;

  const Track({
    required this.id,
    required this.title,
    required this.duration,
    required this.artists,
    this.coverUrl,
  });
}
