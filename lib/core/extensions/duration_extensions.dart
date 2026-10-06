extension DurationExtensions on Duration {
  String get formatted {
    final int minutes = inMinutes;
    final int seconds = inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
