import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_back_button.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/strings.dart' show Strings;
import 'package:heart_sync/pages/forgot_password/forgot_password_controller.dart';

/// A view class for the Forgot Password screen.
class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordController controller =
      Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppConstants.hideKeyboard(),
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
                      const SizedBox(height: 40),
                      // Center(child: Image.asset(ImgRes.imgLogin, width: 250)),
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.hzPadding,
                        ),
                        child: Text(
                          Strings.textForgotPassword.tr,
                          style: CommonUI.customTextStyle(
                            fontFamily: AppFonts.fontSemiBold,
                            fontSize: AppFontSizes.font16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.emailController,
                        hintText: Strings.textEmail.tr,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Obx(() {
                  return CustomButton(
                    text: Strings.textForgotPassword.tr,
                    onPressed:
                        () =>
                            controller.isLoading.value
                                ? null
                                : controller.sendPasswordResetEmail(),
                    horizontalMargin: AppConstants.hzPadding,
                    isLoading: controller.isLoading.value,
                  );
                }),
              ),
              const SizedBox(height: AppConstants.bottomSpace),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(right: Get.width - 40),
              child: CustomBackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
