import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void showSnackBar(String message) {
    final messenger = ScaffoldMessenger.of(this);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}
