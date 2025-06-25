import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// A page that allows the user to set their distance preference for potential matches.
class DistancePage extends GetView<OnboardingController> {
  const DistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 160),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
            child: Text(
              "Your distance preference?",
              style: CommonUI.customTextStyle(
                fontFamily: AppFonts.fontBold,
                fontSize: AppFontSizes.font20,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
            child: Text(
              "Use the slider to set the maximum distance you want your potential matches to be located.",
              style: CommonUI.customTextStyle(),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.hzPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Distance Preference",
                      style: CommonUI.customTextStyle(),
                    ),
                    Obx(() {
                      return Text(
                        '${controller.distanceProgressValue.value.toString()} Km',
                        style: CommonUI.customTextStyle(),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() {
                  return NeumorphicSlider(
                    value: controller.distanceProgressValue.value.toDouble(),
                    min: 1,
                    max: 100,
                    onChanged:
                        (value) => controller.onDistanceRangeChange(value),
                    height: 12,
                    style: SliderStyle(
                      depth: 4,
                      accent: AppColors.white,
                      variant: AppColors.white,
                      lightSource: LightSource.topLeft,
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
