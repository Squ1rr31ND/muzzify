import 'package:flutter/material.dart';

import '../../../../core/extensions/string_list_extensions.dart';

class AudioTile extends StatelessWidget {
  static const int _maxLines = 1;
  static const TextOverflow _overflow = TextOverflow.ellipsis;

  const AudioTile({
    super.key,
    required this.title,
    this.artistNames = const [],
    this.coverImageUrl,
    this.trailing,
    this.onTap,
  });

  final String title;
  final List<String> artistNames;
  final String? coverImageUrl;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: coverImageUrl != null
          ? Image.network(
              coverImageUrl!,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            )
          : null,
      title: Text(title, maxLines: _maxLines, overflow: _overflow),
      subtitle: artistNames.isNotEmpty
          ? Text(
              artistNames.commaSeparated,
              maxLines: _maxLines,
              overflow: _overflow,
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
