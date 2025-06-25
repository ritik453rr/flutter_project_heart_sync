import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/static_resources.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// A page that allows the user to select their gender during the onboarding process.
class GenderPage extends GetView<OnboardingController> {
  const GenderPage({super.key});

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
              "Your Gender?",
              style: CommonUI.customTextStyle(
                fontFamily: AppFonts.fontBold,
                fontSize: AppFontSizes.font30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: StaticResources.genderOptionList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                var item = StaticResources.genderOptionList[index];
                return Obx(() {
                  bool isSelected =
                      controller.selectedGenderIndex.value == index;
                  return NeumorphicButton(
                    provideHapticFeedback: true,
                    padding: EdgeInsets.zero,
                    onPressed: () => controller.selectGender(index),
                    style: CommonUI.customNeuMorphismStyle(),
                    margin: EdgeInsets.only(
                      left: AppConstants.hzPadding,
                      right: AppConstants.hzPadding,
                      bottom: 16,
                    ),
                    child: Container(
                      width: Get.width,
                      height: 48,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.hzPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title,
                            style: CommonUI.customTextStyle(
                              fontFamily: AppFonts.fontSemiBold,
                            ),
                          ),
                          if (isSelected)
                            Neumorphic(
                              padding: const EdgeInsets.all(4),
                              style: CommonUI.customNeuMorphismStyle(),
                              child: Icon(
                                Icons.check,
                                color: AppColors.colorPrimary,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
