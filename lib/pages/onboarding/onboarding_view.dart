import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/custom_back_button.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// A view that displays the onboarding process for the user.
class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final OnboardingController controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            // physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              controller.currentPage.value = index;
              controller.progressValue.value =
                  (index + 1) / controller.onboardingPages.length;
            },
            children: controller.onboardingPages,
          ),
          Positioned(
            top: 90,
            left: 20,
            child: SizedBox(
              width: 40,
              height: 50,
              child: CustomBackButton(
                onPressed: () => controller.handleBackPress(),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Obx(() {
              return NeumorphicProgress(
                duration: Duration(milliseconds: 400),
                style: ProgressStyle(
                  depth: 4,
                  accent: AppColors.white,
                  variant: AppColors.white,
                  lightSource: LightSource.topLeft,
                ),
                percent: controller.progressValue.value.clamp(0.0, 1.0),
              );
            }),
          ),
          Positioned(
            bottom: AppConstants.bottomSpace,
            left: 20,
            right: 20,
            child: Obx(() {
              return CustomButton(
                text: AppStrings.textNext.tr,
                onPressed:
                    () =>
                        controller.isLoading.value
                            ? null
                            : controller.handlePageNavigation(),
                isLoading: controller.isLoading.value,
              );
            }),
          ),
        ],
      ),
    );
  }
}
