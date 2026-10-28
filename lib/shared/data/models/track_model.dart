import '../../domain/entities/track.dart';
import 'artist_model.dart';

final class TrackModel {
  static const String _coverSize = '150x150';

  final int id;
  final String? title;
  final int? durationMs;
  final List<ArtistModel>? artists;
  final String? coverUri;

  const TrackModel({
    required this.id,
    this.title,
    this.durationMs,
    this.artists,
    this.coverUri,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    final rawArtists = json['artists'] as List<dynamic>?;

    final artistModels = rawArtists
        ?.map((e) => ArtistModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();

    return TrackModel(
      id: json['id'] as int,
      title: json['title'] as String?,
      durationMs: json['durationMs'] as int?,
      artists: artistModels,
      coverUri: json['coverUri'] as String?,
    );
  }

  Track toEntity() {
    final duration = Duration(milliseconds: durationMs ?? 0);

    final artistEntities =
        artists?.map((e) => e.toEntity()).toList() ?? const [];

    final coverUrl = coverUri != null
        ? 'https://${coverUri!.replaceAll('%%', _coverSize)}'
        : null;

    return Track(
      id: id,
      title: title ?? '',
      duration: duration,
      artists: artistEntities,
      coverUrl: coverUrl,
    );
  }
}
