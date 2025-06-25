import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/strings.dart';

/// A widget that displays the sign-up header with an image and title.
Widget signupHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
        child: Text(
          Strings.textSignUpTitle.tr,
          style: CommonUI.customTextStyle(
            fontFamily: AppFonts.fontSemiBold,
            fontSize: AppFontSizes.font16,
          ),
        ),
      ),
    ],
  );
}

/// A widget that displays a login prompt with a clickable text.
Widget loginPrompt() {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${Strings.textAlreadyHaveAccount.tr}? ',
            style: CommonUI.customTextStyle(),
          ),
          TextSpan(
            text: Strings.textLogin.tr,
            style: CommonUI.customTextStyle(
              color: AppColors.colorPrimary,
              fontFamily: AppFonts.fontSemiBold,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppConstants.hideKeyboard();
                    Get.back();
                  },
          ),
        ],
      ),
    ),
  );
}
