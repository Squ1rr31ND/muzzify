import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  static const double _borderRadius = 28.0;

  const SearchInput({
    super.key,
    required this.controller,
    this.hintText,
    this.onSubmitted,
    this.onCleared,
  });

  final TextEditingController controller;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onCleared;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final hasQuery = value.text.isNotEmpty;

        return TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: hasQuery
                ? IconButton(
                    onPressed: () {
                      controller.clear();
                      onCleared?.call();
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
            ),
          ),
          onSubmitted: onSubmitted,
        );
      },
    );
  }
}
