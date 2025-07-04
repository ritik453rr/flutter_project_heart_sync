import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/signup/signup_controller.dart';
import 'package:heart_sync/pages/signup/widgets/signup_widgets.dart';

/// A View class for the Login screen.
class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      top: false,
      // topColor: AppColors.background,
      child: GestureDetector(
        onTap: () => AppConstants.hideKeyboard(),
        child: Scaffold(
          appBar: CustomAppBar(
             shadow: false,
            hideBackButton: true,
            appBarHeight: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.hzPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        AppStrings.textSignUpTitle.tr,
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
                      Obx(() {
                        return CustomTextField(
                          controller: controller.passwordController,
                          hintText: AppStrings.textPassword.tr,
                          obSecureText:
                              controller.isPasswordVisible.value ? false : true,
                          suffixIcon:
                              controller.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                          showSuffixIcon: true,
                          suffixIconTap:
                              () => controller.togglePasswordVisibility(),
                          isTextInputDone: true,
                        );
                      }),
                      const SizedBox(height: 20),
                      Obx(() {
                        return CustomTextField(
                          controller: controller.confirmPasswordController,
                          hintText: AppStrings.textConfirmPassword.tr,
                          obSecureText:
                              controller.isConfirmPasswordVisible.value
                                  ? false
                                  : true,
                          suffixIcon:
                              controller.isConfirmPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                          showSuffixIcon: true,
                          suffixIconTap:
                              () =>
                                  controller.toggleConfirmPasswordVisibility(),
                          isTextInputDone: true,
                        );
                      }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              CustomButton(
                text: AppStrings.textSignUp.tr,
                onPressed:
                    () =>
                        controller.isLoading.value ? null : controller.signUp(),
                horizontalMargin: AppConstants.hzPadding,
                isLoading: controller.isLoading,
              ),

              const SizedBox(height: 20),
              loginPrompt(),
              const SizedBox(height: AppConstants.bottomSpace),
            ],
          ),
        ),
      ),
    );
  }
}
