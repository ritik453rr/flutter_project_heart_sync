import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';

/// A custom back button with a 3D Neumorphic effect...
class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final Color iconColor;
  final double depth;
  final double buttonWidth;
  final double buttonHeight;
  final double leftPadding;
  final IconData icon;

 const CustomBackButton({
    super.key,
    this.onPressed,
    this.color = AppColors.white,
    this.iconColor = AppColors.black,
    this.depth = 5.0,
    this.buttonWidth = 50.0,
    this.buttonHeight = 50.0,
    this.leftPadding = 8.0,
    this.icon = Icons.arrow_back_ios,
  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: color,
        depth: depth,
        intensity: 0.8,
        surfaceIntensity: 0.3,
        lightSource: LightSource.topLeft,
        shadowLightColor: AppColors.white,
        shadowDarkColor: Colors.black54,
        boxShape: const NeumorphicBoxShape.circle(),
      ),
      child: NeumorphicButton(
        onPressed: onPressed ?? () => Get.back(),
        padding: EdgeInsets.only(left: leftPadding),
        style: NeumorphicStyle(
          color: color,
          depth: depth > 0 ? -depth : depth,
          intensity: 0.8,
          surfaceIntensity: 0.4,
          shadowLightColor: Colors.white,
          shadowDarkColor: Colors.black54,
          boxShape: const NeumorphicBoxShape.circle(),
        ),
        child: Center(
          child: SizedBox(
            height: buttonHeight,
            width: buttonWidth,
            child: Icon(icon, size: 20, color: iconColor),
          ),
        ),
      ),
    );
  }
}
