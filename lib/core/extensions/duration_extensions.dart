extension DurationExtensions on Duration {
  String toTimeString() {
    final hours = inHours;
    final minutes = inMinutes % 60;
    final seconds = inSeconds % 60;
    final formattedSeconds = seconds.toString().padLeft(2, '0');

    if (hours > 0) {
      final formattedMinutes = minutes.toString().padLeft(2, '0');
      return '$hours:$formattedMinutes:$formattedSeconds';
    }

    return '$minutes:$formattedSeconds';
  }
}
