import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/routing/app_routes.dart';

/// A widget that displays a sign-up prompt with a clickable text.
Widget signUpPrompt() {
  return Center(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${AppStrings.textDontHaveAccount.tr}? ',
            style: CommonUI.customTextStyle(),
          ),
          TextSpan(
            text: AppStrings.textSignUp.tr,
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
  return Align(
    alignment: Alignment.centerRight,
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        AppConstants.hideKeyboard();
        Get.toNamed(AppRoutes.forgotPassword);
      },
      child: Text(
        AppStrings.textForgotPassword.tr,
        style: CommonUI.customTextStyle(
          color: AppColors.colorPrimary,
          fontFamily: AppFonts.fontSemiBold,
        ),
      ),
    ),
  );
}
