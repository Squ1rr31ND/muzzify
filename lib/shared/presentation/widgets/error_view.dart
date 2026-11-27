import 'package:material_ui/material_ui.dart';

import '../../extensions/build_context_extensions.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.info_outlined, size: 64.0),
          const SizedBox(height: 8.0),
          Text(
            message,
            style: const TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 12.0),
            FilledButton(
              onPressed: onRetry,
              child: Text(context.l10n.errorRetry),
            ),
          ],
        ],
      ),
    );
  }
}
