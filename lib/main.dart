import 'package:material_ui/material_ui.dart';

import 'core/app.dart';
import 'core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupAllDependencies();
  runApp(const MuzzifyApp());
}
