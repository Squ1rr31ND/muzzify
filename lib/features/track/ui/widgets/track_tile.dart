import 'package:flutter/material.dart';

import '../../../../shared/extensions/duration_extensions.dart';
import '../../../../shared/extensions/string_list_extensions.dart';
import '../../../../shared/ui/widgets/audio_cover.dart';
import '../../../../shared/ui/widgets/truncated_text.dart';
import '../../domain/entities/track.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({super.key, required this.track, required this.onTap});

  final Track track;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AudioCover(imageUrl: track.coverImageUrl),
      title: TruncatedText(track.title ?? ''),
      subtitle: track.artistNames.isNotEmpty
          ? TruncatedText(track.artistNames.commaSeparated)
          : null,
      trailing: Text(track.duration.formatted),
      onTap: onTap,
    );
  }
}
