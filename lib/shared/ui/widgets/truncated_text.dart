import 'package:flutter/widgets.dart';

class TruncatedText extends StatelessWidget {
  const TruncatedText(
    this.text, {
    super.key,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  final String text;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) =>
      Text(text, maxLines: maxLines, overflow: overflow);
}
