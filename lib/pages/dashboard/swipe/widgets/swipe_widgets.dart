import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../../../../common/app_colors.dart' show AppColors;
import '../../../../common/common_ui.dart';

/// A function that builds action button on swipe view.
Widget acButton({
  void Function()? onTap,
  Color color = AppColors.white,
  IconData icon = Icons.favorite,
  Color iconColor = AppColors.red,
}) {
  return NeumorphicButton(
    padding: EdgeInsets.all(8),
    style: CommonUI.customNeuMorphismStyle(
      boxShape: NeumorphicBoxShape.circle(),
    ),
    onPressed: onTap,
    child: Icon(icon, color: iconColor, size: 30),
  );
}
