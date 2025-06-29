import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/app_strings.dart';

/// A Custom Alert Dialog that shows a message and has two buttons: Yes and No.
class confirmPasswordDialog {
  customAlertBox({
    String confirmButtonText = "Yes",
    String cancelButtonText = "No",
    void Function()? onConfirmPressed,
    IconData icon = CupertinoIcons.square_arrow_right,
  }) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        TextEditingController passwordController = TextEditingController();
        // final user = FirebaseAuth.instance.currentUser;
        //AppStorage appStorage = AppStorage();

        // if (user == null) {
        //   Get.snackbar('Error', 'No user signed in.', snackPosition: SnackPosition.BOTTOM);
        // }
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(
                AppStrings.textConfirmPassword.tr,
                style: CommonUI.customTextStyle(
                  fontSize: AppFontSizes.font16,
                  fontFamily: AppFonts.fontSemiBold,
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                borderRadius: 10,
                controller: passwordController,
                hintText: "Enter Password",
                obSecureText: true,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      horizontalMargin: 20,
                      fontSize: AppFontSizes.font12,
                      borderRadius: 10,
                      height: 35,
                      text: AppStrings.textCancel.tr,
                      onPressed: () {
                        AppConstants.hideKeyboard();
                        Get.back();
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      horizontalMargin: 20,
                      fontSize: AppFontSizes.font12,
                      borderRadius: 10,
                      height: 35,
                      text: AppStrings.textDelete.tr,
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
