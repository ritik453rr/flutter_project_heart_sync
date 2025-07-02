import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/reauthentication/reauthentication_controller.dart';
import 'package:heart_sync/services/firebase_services.dart';

class ReauthenticationView extends StatelessWidget {
  ReauthenticationView({super.key});
  final controller = Get.find<ReauthenticationController>();
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.background,
      child: Scaffold(
        appBar: CustomAppBar(title: "Delete Account"),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.hzPadding,
            vertical: AppConstants.hzPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: CommonUI.customTextStyle(
                  fontSize: AppFontSizes.font16,
                  fontFamily: AppFonts.fontSemiBold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "Enter Email",
                controller: controller.emailController,
              ),
              const SizedBox(height: 20),
              Text(
                "Password",
                style: CommonUI.customTextStyle(
                  fontSize: AppFontSizes.font16,
                  fontFamily: AppFonts.fontSemiBold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "Enter Password",
                controller: controller.passwordController,
              ),
              const Spacer(),
              CustomButton(
                text: "Delete",
                onPressed: () {
                  controller.onTapDelete();
                },
                horizontalMargin: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
