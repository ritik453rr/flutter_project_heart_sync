import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_image_picker.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// This page is used to upload a picture
class UploadPicturePage extends GetView<OnboardingController> {
  const UploadPicturePage({super.key});

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
              "Add your recent pics",
              style: CommonUI.customTextStyle(
                fontFamily: AppFonts.fontBold,
                fontSize: AppFontSizes.font30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
            child: Text(
              "Upload 2 photos to start. Add 4 or more to make your profile stand out.",
              style: CommonUI.customTextStyle(),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: CustomImagePicker(
              selectedImages: controller.selectedImages,
              onImageSelected: (index, pickedImages) {
                controller.setImageAt(index, pickedImages);
              },
            ),
          ),
        ],
      ),
    );
  }
}
