import 'package:flutter/material.dart';

import 'core/app.dart';
import 'core/di/di.dart';

void main() {
  setupAllDependencies();
  runApp(const MuzzifyApp());
}
