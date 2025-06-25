import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/splash/splash_controller.dart';

/// A View class for the Splash screen.
class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: NeumorphicText(
          Strings.textAppName.tr,
          style: NeumorphicStyle(
            color: AppColors.white,
            intensity: 1,
            surfaceIntensity: 0.3,
            lightSource: LightSource.topLeft,
            shadowDarkColor: Colors.black54,
            depth: 2,
            shape: NeumorphicShape.concave,
          ),
          textStyle: NeumorphicTextStyle(fontSize: AppFontSizes.font20),
        ),
      ),
    );
  }
}
