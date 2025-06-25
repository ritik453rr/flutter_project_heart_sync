import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

/// This function shows a bottom sheet with options to select an image from the camera or gallery.
void showImagePickerBottomSheet({
  required BuildContext context,
  required void Function(XFile image) onImageSelected,
}) {
  final ImagePicker picker = ImagePicker();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: AppConstants.hzPadding,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Image Source',
              style: CommonUI.customTextStyle(
                fontFamily: AppFonts.fontSemiBold,
                fontSize: AppFontSizes.font20,
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 25,
              leading: NeumorphicButton(
                provideHapticFeedback: true,
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (image != null) {
                    onImageSelected(image);
                  }
                  Get.back();
                },
                style: CommonUI.customNeuMorphismStyle(),
                child: const Icon(CupertinoIcons.camera, size: 16),
              ),
              title: Text(
                'Camera',
                style: CommonUI.customTextStyle(fontSize: AppFontSizes.font16),
              ),
              onTap: () async {
                final XFile? image = await picker.pickImage(
                  source: ImageSource.camera,
                );
                if (image != null) {
                  onImageSelected(image);
                }
                Get.back();
              },
            ),

            /// Gallery Option
            ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 25,
              leading: NeumorphicButton(
                provideHapticFeedback: true,
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    onImageSelected(image);
                  }
                  Get.back();
                },
                style: CommonUI.customNeuMorphismStyle(),
                child: const Icon(CupertinoIcons.photo, size: 16),
              ),
              title: Text(
                'Gallery',
                style: CommonUI.customTextStyle(fontSize: AppFontSizes.font16),
              ),
              onTap: () async {
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  onImageSelected(image);
                }
                Get.back();
              },
            ),
          ],
        ),
      );
    },
  );
}
