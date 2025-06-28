import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/dialogs/ok_cancel_dialog.dart';
import 'package:heart_sync/language/strings.dart';
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
      appBar: CustomAppBar(title: Strings.textSettings.tr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            NeumorphicButton(
              onPressed: () {},
              provideHapticFeedback: true,
              style: CommonUI.customNeuMorphismStyle(),
              margin: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.whatshot),
                        Text(
                          Strings.textAppName.tr,
                          style: CommonUI.customTextStyle(
                            fontFamily: AppFonts.fontSemiBold,
                            fontSize: AppFontSizes.font16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      Strings.textPriorityLikes.tr,
                      style: CommonUI.customTextStyle(
                        fontSize: AppFontSizes.font12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            customEditProfileItems(
              label: Strings.textAccountSettings.tr,
              title: "Email",
              titleColor: AppColors.black,
              icon: CupertinoIcons.mail,
              onPressed: () {},
            ),
            customEditProfileItems(
              label: Strings.textDistance.tr,
              title: "TEst",
              titleColor: AppColors.black,
              icon: Icons.location_on_outlined,
              onPressed: () {},
            ),
            SizedBox(height: 20),
            Obx(() {
              return customEditProfileItems(
                flex: 9,
                label: Strings.textLocation.tr,
                title: controller.currentLocation.value.toString(),
                titleColor: AppColors.black,
                icon: CupertinoIcons.location,
                onPressed: () {},
              );
            }),
            SizedBox(height: 16),
            customEditProfileItems(
              title: Strings.textShareVibeMate.tr,
              titleColor: AppColors.black,
              icon: Icons.share,
              onPressed:
                  () => Share.shareUri(
                    Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.vibemate',
                    ),
                  ),
            ),
            SizedBox(height: 20),
            Center(
              child: CustomButton(
                width: 250,
                borderRadius: 10,
                text: Strings.textLogOut.tr,
                onPressed: () {
                  OkCancelDialog().customAlertBox(
                    title: Strings.textLogOut.tr,
                    subTitle: '${Strings.textLogOutTitle.tr}?',
                    onConfirmPressed: () {
                      controller.logout();
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            // Center(
            //   child: SvgPicture.asset(
            //     ImgRes.svgFlame, color: AppColors.colorPink, height: 50,),
            // ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Version 1.1',
                style: CommonUI.customTextStyle(
                  fontFamily: AppFonts.fontRegular,
                  fontSize: AppFontSizes.font12,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: CustomButton(
                borderRadius: 10,
                onPressed: () {
                  OkCancelDialog().customAlertBox(
                    title: Strings.textDeleteAccount.tr,
                    subTitle: '${Strings.textDeleteAccountMsg.tr}?',
                    icon: CupertinoIcons.delete,
                    onConfirmPressed: () {},
                  );
                },
                width: 250,
                text: Strings.textDeleteAccount.tr,
              ),
            ),
            SizedBox(height: AppConstants.bottomSpace),
          ],
        ),
      ),
    );
  }
}
