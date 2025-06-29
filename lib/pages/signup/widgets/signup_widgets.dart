import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';



/// A widget that displays a login prompt with a clickable text.
Widget loginPrompt() {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${AppStrings.textAlreadyHaveAccount.tr}? ',
            style: CommonUI.customTextStyle(),
          ),
          TextSpan(
            text: AppStrings.textLogin.tr,
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
