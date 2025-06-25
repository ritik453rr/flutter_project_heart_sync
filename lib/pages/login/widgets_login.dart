import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/routing/app_routes.dart';

/// A widget that displays the login header with an image and title.
Widget loginHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //Center(child: Image.asset(ImgRes.imgLogin, width: 250)),
      const SizedBox(height: 30),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
        child: Text(
          Strings.textLoginTitle.tr,
          style: CommonUI.customTextStyle(
            fontFamily: AppFonts.fontSemiBold,
            fontSize: AppFontSizes.font16,
          ),
        ),
      ),
    ],
  );
}

/// A widget that displays a sign-up prompt with a clickable text.
Widget signUpPrompt() {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${Strings.textDontHaveAccount.tr}? ',
            style: CommonUI.customTextStyle(),
          ),
          TextSpan(
            text: Strings.textSignUp.tr,
            style: CommonUI.customTextStyle(
              color: AppColors.colorPrimary,
              fontFamily: AppFonts.fontSemiBold,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppConstants.hideKeyboard();
                    Get.toNamed(AppRoutes.signUp);
                  },
          ),
        ],
      ),
    ),
  );
}

/// A widget that displays a forgot password prompt with a clickable text.
Widget forgotPasswordPrompt() {
  return Padding(
    padding: EdgeInsets.only(right: AppConstants.hzPadding),
    child: Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          AppConstants.hideKeyboard();
          Get.toNamed(AppRoutes.forgotPassword);
        },
        child: Text(
          Strings.textForgotPassword.tr,
          style: CommonUI.customTextStyle(color: AppColors.colorPrimary),
        ),
      ),
    ),
  );
}
