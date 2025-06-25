import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/static_resources.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// A page that allows the user to select what they are looking for.
class LookingForPage extends GetView<OnboardingController> {
  const LookingForPage({super.key});

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
              "What are you looking for?",
              style: CommonUI.customTextStyle(
                fontFamily: AppFonts.fontBold,
                fontSize: AppFontSizes.font30,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
            child: Text(
              "All good if it changes. There is something for everyone.",
              style: CommonUI.customTextStyle(),
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.67,
            ),
            itemBuilder: (context, index) {
              var item = StaticResources.lookingForOptionList[index];
              return Obx(() {
                bool isSelected =
                    controller.selectedLookingForIndex.value == index;
                return NeumorphicButton(
                  style: CommonUI.customNeuMorphismStyle(
                    borderWidth: 2,
                    borderColor: isSelected ? Colors.pink : Colors.transparent,
                  ),
                  onPressed: () => controller.selectLookingFor(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.imagePath,
                          color: Colors.pinkAccent,
                          size: 38,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.title,
                          style: CommonUI.customTextStyle(
                            fontSize: AppFontSizes.font12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
