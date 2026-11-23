abstract interface class TrackRepository {
  Future<String> getDownloadUrl(int trackId);
}
