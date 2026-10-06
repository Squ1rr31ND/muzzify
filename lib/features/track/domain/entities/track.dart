final class Track {
  final String id;
  final String? title;
  final List<String> artistNames;
  final Duration duration;
  final String? coverImageUrl;

  const Track({
    required this.id,
    required this.duration,
    this.title,
    this.artistNames = const [],
    this.coverImageUrl,
  });
}
