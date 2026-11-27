import 'package:material_ui/material_ui.dart';

import '../../../core/colors/app_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, this.size = 24.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(size / 4),
      ),
      width: size,
      height: size,
      child: Icon(
        Icons.animation,
        size: size / 1.5,
        color: AppColors.iconForeground,
      ),
    );
  }
}
