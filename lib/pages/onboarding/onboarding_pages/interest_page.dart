import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/static_resources.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// A page that displays a list of interests for the user to select from.
class InterestPage extends GetView<OnboardingController> {
  final List<String> interestList;

  const InterestPage({super.key, required this.interestList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingController>(
        builder:
            (_) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.hzPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What are you into?",
                          style: CommonUI.customTextStyle(
                            fontFamily: AppFonts.fontBold,
                            fontSize: AppFontSizes.font30,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'You like what you like. Now, let everyone know.',
                          style: CommonUI.customTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.hzPadding,
                      ),
                      child: SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 12,
                          spacing: 16,
                          children:
                              StaticResources.interestOptionList.map((
                                interest,
                              ) {
                                return NeumorphicButton(
                                  style: CommonUI.customNeuMorphismStyle(),
                                  provideHapticFeedback: true,
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  child: ChoiceChip(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    label: Text(
                                      interest,
                                      style: CommonUI.customTextStyle(
                                        color:
                                            controller.selectedInterest
                                                    .contains(interest)
                                                ? AppColors.white
                                                : AppColors.black,
                                      ),
                                    ),
                                    showCheckmark: false,
                                    selected: controller.selectedInterest
                                        .contains(interest),
                                    backgroundColor: AppColors.white,
                                    selectedColor:
                                        controller.selectedInterest.contains(
                                              interest,
                                            )
                                            ? AppColors.colorPrimary
                                            : AppColors.white,
                                    onSelected: (selected) {
                                      if (selected) {
                                        controller.selectedInterest.add(
                                          interest,
                                        );
                                      } else {
                                        controller.selectedInterest.remove(
                                          interest,
                                        );
                                      }
                                      controller.update();
                                    },
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 65),
                    child: Divider(),
                  ),
                  const SizedBox(height: AppConstants.bottomSpace),
                ],
              ),
            ),
      ),
    );
  }
}
