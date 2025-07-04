import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/app_images.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/login/login_controller.dart';
import 'package:heart_sync/pages/login/widgets_login.dart';
import 'package:heart_sync/services/firebase_services.dart';

/// A View class for the Login screen.
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppConstants.hideKeyboard(),
      child: ColorfulSafeArea(
         top: false,
      // topColor: AppColors.background,
        child: Scaffold(
          appBar: CustomAppBar(
            shadow: false,
            hideBackButton: true,
            appBarHeight: 0,
          ),
          
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.hzPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.hzPadding,
                    vertical: 20,
                  ),
                  child: Text(
                    AppStrings.textLoginTitle.tr,
                    style: CommonUI.customTextStyle(
                      fontFamily: AppFonts.fontSemiBold,
                      fontSize: AppFontSizes.font16,
                    ),
                  ),
                ),
                Center(
                  child: CommonUI.setPng(AppImages.pngLogin, height: 170),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: AppStrings.textEmail.tr,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
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
                const SizedBox(height: 16),
                forgotPasswordPrompt(),
                const SizedBox(height: 20),
                  
                CustomButton(
                  text: AppStrings.textLogin.tr,
                  onPressed:
                      () =>
                          controller.isLoading.value
                              ? null
                              : controller.login(),
                  isLoading: controller.isLoading,
                ),
                  
                const SizedBox(height: 20),
                  
                CustomButton(
                  text: AppStrings.textContinueWithGoogle.tr,
                  imagePath: AppImages.svgGoogle,
                  showImage: true,
                  onPressed: () async {
                    controller.loginWithGoogle();
                  },
                  isLoading: FirebaseServices.isSigning,
                ),
                  
                const SizedBox(height: 20),
                signUpPrompt(),
                const SizedBox(height: AppConstants.bottomSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
