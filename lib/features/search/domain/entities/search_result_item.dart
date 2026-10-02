import '../../../album/domain/entities/album.dart';
import '../../../track/domain/entities/track.dart';

sealed class SearchResultItem {
  const SearchResultItem();
}

final class TrackSearchResultItem extends SearchResultItem {
  final Track track;

  const TrackSearchResultItem(this.track);
}

final class AlbumSearchResultItem extends SearchResultItem {
  final Album album;

  const AlbumSearchResultItem(this.album);
}
