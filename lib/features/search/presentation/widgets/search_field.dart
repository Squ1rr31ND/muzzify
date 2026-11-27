import 'package:material_ui/material_ui.dart';

class SearchField extends StatelessWidget {
  static const double _borderRadius = 28.0;

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onCleared;
  final String? hintText;
  final bool? filled;

  const SearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
    required this.onCleared,
    this.hintText,
    this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return child!;
          },
          child: IconButton(
            onPressed: () {
              controller.clear();
              onCleared();
            },
            icon: const Icon(Icons.clear),
          ),
        ),
        filled: filled,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        ),
      ),
      textInputAction: TextInputAction.search,
      autofocus: true,
      onSubmitted: onSubmitted,
    );
  }
}
