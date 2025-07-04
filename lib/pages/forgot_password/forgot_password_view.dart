import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/app_images.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/app_strings.dart' show AppStrings;
import 'package:heart_sync/pages/forgot_password/forgot_password_controller.dart';

/// A view class for the Forgot Password screen.
class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppConstants.hideKeyboard(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.hzPadding,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Center(
                          child: CommonUI.setPng(
                            AppImages.pngLogin,
                            height: 170,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          AppStrings.textForgotPassword.tr,
                          style: CommonUI.customTextStyle(
                            fontFamily: AppFonts.fontSemiBold,
                            fontSize: AppFontSizes.font16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: AppStrings.textEmail.tr,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: 
                    CustomButton(
                      text: AppStrings.textResetPassword.tr,
                      onPressed:
                          () =>
                              controller.isLoading.value
                                  ? null
                                  : controller.sendPasswordResetEmail(),
                      horizontalMargin: AppConstants.hzPadding,
                      isLoading: controller.isLoading,
                    ),                  
                ),
                const SizedBox(height: AppConstants.bottomSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
