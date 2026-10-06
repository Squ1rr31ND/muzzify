final class Track {
  final String id;
  final String? title;
  final List<String> artists;
  final Duration duration;
  final String? coverImageUrl;

  const Track({
    required this.id,
    required this.duration,
    this.title,
    this.artists = const [],
    this.coverImageUrl,
  });
}
