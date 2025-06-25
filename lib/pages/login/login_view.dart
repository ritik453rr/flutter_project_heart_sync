import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/login/login_controller.dart';
import 'package:heart_sync/pages/login/widgets_login.dart';

/// A View class for the Login screen.
class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppConstants.hideKeyboard(),
      child: SafeArea(
        child: Scaffold(
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                AppConstants.hideKeyboard();
              }
              return true;
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        loginHeader(),
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
                                controller.isPasswordVisible.value
                                    ? false
                                    : true,
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
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Obx(() {
                        return CustomButton(
                          text: Strings.textLogin.tr,
                          horizontalMargin: AppConstants.hzPadding,
                          onPressed:
                              () =>
                                  controller.isLoading.value
                                      ? null
                                      : controller.login(),
                          isLoading: controller.isLoading.value,
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    signUpPrompt(),
                    const SizedBox(height: AppConstants.bottomSpace),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
