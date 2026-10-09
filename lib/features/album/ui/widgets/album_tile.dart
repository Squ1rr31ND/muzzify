import 'package:flutter/material.dart';

import '../../../../shared/extensions/string_list_extensions.dart';
import '../../../../shared/ui/widgets/audio_cover.dart';
import '../../../../shared/ui/widgets/truncated_text.dart';
import '../../domain/entities/album.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({super.key, required this.album, required this.onTap});

  final Album album;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AudioCover(imageUrl: album.coverImageUrl),
      title: TruncatedText(album.title ?? ''),
      subtitle: album.artistNames.isNotEmpty
          ? TruncatedText(album.artistNames.commaSeparated)
          : null,
      onTap: onTap,
    );
  }
}
