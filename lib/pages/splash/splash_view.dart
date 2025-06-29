import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/splash/splash_controller.dart';

/// A View class for the Splash screen.
class SplashView extends StatelessWidget {
  SplashView({super.key});

  final controller = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: NeumorphicText(
          AppStrings.textAppName.tr,
          style: CommonUI.customNeuMorphismStyle(
            depth: 2,
            shape: NeumorphicShape.flat,
          ),
          textStyle: NeumorphicTextStyle(fontSize: AppFontSizes.font40),
        ),
      ),
    );
  }
}
