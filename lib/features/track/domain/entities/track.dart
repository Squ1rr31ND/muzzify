class Track {
  final String id;
  final String? title;
  final List<String> artists;
  final String? coverImageUrl;

  const Track({
    required this.id,
    this.title,
    this.artists = const [],
    this.coverImageUrl,
  });
}
