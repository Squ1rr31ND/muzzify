import 'package:flutter/material.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/extensions/duration_extensions.dart';
import '../../domain/entities/track.dart';

class TrackTile extends StatelessWidget {
  static const double _coverBorderRadius = 8.0;
  static const double _coverSize = 56.0;
  static const double _coverPlaceholderIconSize = 36.0;
  static const TextOverflow _textOverflow = TextOverflow.ellipsis;
  static const int _textMaxLines = 1;
  static const double _tileHeight = 72.0;

  final Track track;
  final VoidCallback? onTap;

  const TrackTile({super.key, required this.track, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(_coverBorderRadius),
        child: Container(
          color: context.colorScheme.secondaryContainer,
          width: _coverSize,
          height: _coverSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.music_note_outlined,
                size: _coverPlaceholderIconSize,
                color: context.colorScheme.onSecondaryContainer,
              ),
              if (track.coverUrl != null)
                Image.network(
                  track.coverUrl!,
                  width: _coverSize,
                  height: _coverSize,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const SizedBox.shrink(),
                ),
            ],
          ),
        ),
      ),
      title: Text(
        track.title,
        style: TextStyle(fontWeight: FontWeight.bold),
        overflow: _textOverflow,
        maxLines: _textMaxLines,
      ),
      subtitle: track.artists.isNotEmpty
          ? Text(
              track.artists.map((artist) => artist.name).join(', '),
              overflow: _textOverflow,
              maxLines: _textMaxLines,
            )
          : null,
      trailing: Text(track.duration.toTimeString()),
      onTap: onTap,
      minTileHeight: _tileHeight,
    );
  }
}
