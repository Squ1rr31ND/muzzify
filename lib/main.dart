import 'package:flutter/material.dart';

import 'app/application.dart';
import 'core/di/service_locator.dart';

void main() {
  setupLocator();

  runApp(const Application());
}
