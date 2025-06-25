import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

import '../../../common/custom_textfield.dart';

/// A page that allows the user to enter their dob during the onboarding process.
class DobPage extends GetView<OnboardingController> {
  const DobPage({super.key});

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
              "Your DOB?",
              style: CommonUI.customTextStyle(
                fontFamily: AppFonts.fontBold,
                fontSize: AppFontSizes.font30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: controller.dobController,
            borderRadius: 10,
            hintText: "DD/MM/YYYY",
            readOnly: true,
            onTap: () async {
              DateTime? selectedDate =
                  await AppConstants.showPlatformDatePicker(
                    context: context,
                    initialDate: controller.dob.value,
                  );
              if (selectedDate != null) {
                controller.setDate(selectedDate);
              }
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
            child: Text(
              "We need to know your date of birth to make sure your are old enough to use Vibe Mate.",
              style: CommonUI.customTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
