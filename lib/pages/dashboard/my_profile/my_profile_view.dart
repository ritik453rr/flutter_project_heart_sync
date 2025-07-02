import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/dashboard/my_profile/my_profile_controller.dart';
import 'package:heart_sync/pages/dashboard/my_profile/widgets/my_profile_widgets.dart';
import 'package:heart_sync/routing/app_routes.dart';
import 'package:shimmer/shimmer.dart';

/// MyProfileView class is used to show the profile of the user
class MyProfileView extends StatelessWidget {
  MyProfileView({super.key});

  final MyProfileController controller = Get.find<MyProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Neumorphic(
              padding: const EdgeInsets.all(4),
              style: const NeumorphicStyle(
                depth: 4,
                intensity: 0.5,
                surfaceIntensity: 0.5,
                color: AppColors.white,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.white,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg",
                    placeholder:
                        (context, url) => Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: AppColors.white,
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.white,
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Shimmer.fromColors(
                          baseColor: AppColors.gray,
                          highlightColor: AppColors.white,
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.white,
                          ),
                        ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          NeumorphicText(
            "User Name",
            style: NeumorphicStyle(
              depth: 4,
              color: AppColors.gray,
              shadowLightColorEmboss: AppColors.gray.withOpacity(0.3),
              shadowDarkColorEmboss: AppColors.gray.withOpacity(0.3),
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: AppFontSizes.font16,
              fontFamily: AppFonts.fontSemiBold,
            ),
          ),

          const SizedBox(height: 30),
          customProfileItems(
            title: AppStrings.textProfile.tr,
            icon: CupertinoIcons.person,
            onPressed: () => Get.toNamed(AppRoutes.profile),
          ),
          const SizedBox(height: 16),
          customProfileItems(
            title: AppStrings.textSettings.tr,
            icon: CupertinoIcons.settings,
            onPressed: () => Get.toNamed(AppRoutes.setting),
          ),
          const SizedBox(height: 16),
          customProfileItems(
            title: AppStrings.textPrivacy.tr,
            icon: CupertinoIcons.lock_shield,
            onPressed: () => controller.launchPrivacyPolicy(),
          ),
         const  SizedBox(height: 16),
          customProfileItems(
            title: AppStrings.textContactUs.tr,
            icon: CupertinoIcons.mail,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
