import '../../domain/entities/artist.dart';

final class ArtistModel {
  final int id;
  final String? name;

  const ArtistModel({required this.id, this.name});

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      ArtistModel(id: json['id'] as int, name: json['name'] as String?);

  Artist toEntity() => Artist(id: id, name: name ?? '');
}
