import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/signup/signup_controller.dart';
import 'package:heart_sync/pages/signup/widgets/signup_widgets.dart';

/// A View class for the Login screen.
class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppConstants.hideKeyboard(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        signupHeader(),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: Strings.textEmail.tr,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        Obx(() {
                          return CustomTextField(
                            controller: controller.passwordController,
                            hintText: Strings.textPassword.tr,
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
                            hintText: Strings.textConfirmPassword.tr,
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
              ),
              const SizedBox(height: 10),
              Obx(() {
                return CustomButton(
                  text: Strings.textSignUp.tr,
                  onPressed:
                      () =>
                          controller.isLoading.value
                              ? null
                              : controller.createUser(),
                  horizontalMargin: AppConstants.hzPadding,
                  isLoading: controller.isLoading.value,
                );
              }),
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
