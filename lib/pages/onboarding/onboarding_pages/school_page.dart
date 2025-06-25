import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// This page allows the user to enter their school name.
class SchoolPage extends GetView<OnboardingController> {
  const SchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => AppConstants.hideKeyboard(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 160),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
              child: Text(
                "If school's your thing...",
                style: CommonUI.customTextStyle(
                  fontFamily: AppFonts.fontBold,
                  fontSize: AppFontSizes.font30,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: controller.schoolController,
              borderRadius: 10,
              isTextCapital: true,
              isTextInputDone: true,
              textCapitalization: TextCapitalization.words,
              hintText: "Enter school name, past or current",
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
              child: Text(
                "This is how it'll appear on your profile.",
                style: CommonUI.customTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
