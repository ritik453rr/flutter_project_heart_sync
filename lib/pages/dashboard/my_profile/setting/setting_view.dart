import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/app_images.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/dialogs/ok_cancel_dialog.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/dashboard/my_profile/edit_profile/widgets/edit_profile_widgets.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/setting_controller.dart';
import 'package:share_plus/share_plus.dart';

/// A Stateless widget that represents the settings view in the application.
class SettingView extends StatelessWidget {
  SettingView({super.key});

  final SettingController controller = Get.find<SettingController>();

  // final AppStorage appStorage = AppStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.textSettings.tr),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              NeumorphicButton(
                onPressed: () {},
                provideHapticFeedback: true,
                style: CommonUI.customNeuMorphismStyle(),
                margin: const EdgeInsets.symmetric(
                  horizontal: AppConstants.hzPadding,
                ),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.whatshot),
                          Text(
                            AppStrings.textAppName.tr,
                            style: CommonUI.customTextStyle(
                              fontFamily: AppFonts.fontSemiBold,
                              fontSize: AppFontSizes.font16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        AppStrings.textPriorityLikes.tr,
                        style: CommonUI.customTextStyle(
                          fontSize: AppFontSizes.font12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
             const  SizedBox(height: 20),
              customEditProfileItems(
                label: AppStrings.textAccountSettings.tr,
                title: "Email",
                titleColor: AppColors.black,
                icon: CupertinoIcons.mail,
                onPressed: () {},
              ),
              customEditProfileItems(
                label: AppStrings.textDistance.tr,
                title: "TEst",
                titleColor: AppColors.black,
                icon: Icons.location_on_outlined,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              Obx(() {
                return customEditProfileItems(
                  flex: 9,
                  label: AppStrings.textLocation.tr,
                  title: controller.currentLocation.value.toString(),
                  titleColor: AppColors.black,
                  icon: CupertinoIcons.location,
                  onPressed: () {},
                );
              }),
              const SizedBox(height: 16),
              customEditProfileItems(
                title: AppStrings.textShareVibeMate.tr,
                titleColor: AppColors.black,
                icon: Icons.share,
                onPressed:
                    () => Share.shareUri(
                      Uri.parse(
                        'https://play.google.com/store/apps/details?id=com.vibemate',
                      ),
                    ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  width: 250,
                  borderRadius: 10,
                  text: AppStrings.textLogOut.tr,
                  onPressed: () {
                    OkCancelDialog().customAlertBox(
                      title: AppStrings.textLogOut.tr,
                      subTitle: '${AppStrings.textLogOutTitle.tr}?',
                      onConfirmPressed: () {
                        controller.logout();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: CommonUI.setSvg(
                  AppImages.svgFlame,
                  height: 50,
                  color: AppColors.colorPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Version 1.1',
                  style: CommonUI.customTextStyle(
                    fontFamily: AppFonts.fontRegular,
                    fontSize: AppFontSizes.font12,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: CustomButton(
                  borderRadius: 10,
                  onPressed: () {
                    OkCancelDialog().customAlertBox(
                      title: AppStrings.textDeleteAccount.tr,
                      subTitle: '${AppStrings.textDeleteAccountMsg.tr}?',
                      icon: CupertinoIcons.delete,
                      onConfirmPressed: () {
                        controller.deleteAccount();
                      },
                    );
                  },
                  width: 250,
                  text: AppStrings.textDeleteAccount.tr,
                ),
              ),
              SizedBox(height: AppConstants.bottomSpace),
            ],
          ),
        ),
      ),
    );
  }
}
