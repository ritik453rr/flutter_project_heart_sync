import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/dashboard/dashboard_main/widgets_dashboard.dart';

/// A widget to represent a friend request item.
Widget requestItem({
  required String senderName,
  void Function()? onTapAccept,
  void Function()? onTapReject,
}) {
  return NeumorphicButton(
    onPressed: () {},
    margin: EdgeInsets.symmetric(
      horizontal: AppConstants.hzPadding,
      vertical: 10,
    ),
    padding: EdgeInsets.all(20),
    style: CommonUI.customNeuMorphismStyle(),
    child: Row(
      children: [
        NeumorphicIcon(
          Icons.person,
          style: CommonUI.customNeuMorphismStyle(
            color: AppColors.black,
            shadowDarkColor: Colors.black26,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NeumorphicText(
                senderName,
                style: CommonUI.customNeuMorphismStyle(
                  color: AppColors.black,
                  shadowDarkColor: Colors.black26,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: AppFontSizes.font16,
                  fontFamily: AppFonts.fontSemiBold,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            circleButton(
              icon: Icons.check,
              iconColor: AppColors.colorGreen,
              onPressed: onTapAccept,
            ),
            SizedBox(width: 15),
            circleButton(
              icon: Icons.close,
              iconColor: AppColors.red,
              onPressed: onTapReject,
            ),
          ],
        ),
      ],
    ),
  );
}

/// Widget to show when there are no friend requests
Widget emptyRequestsState() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person_add_outlined,
          size: 80,
          color: AppColors.pink.withValues(alpha: 0.5),
        ),
        SizedBox(height: 20),
        NeumorphicText(
          Strings.textNoRequests.tr,
          style: CommonUI.customNeuMorphismStyle(
            color: AppColors.black,
            shadowDarkColor: Colors.black26,
            shadowLightColor: Colors.transparent,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: AppFontSizes.font18,
            fontFamily: AppFonts.fontSemiBold,
          ),
        ),
        SizedBox(height: 10),
        NeumorphicText(
          Strings.textSuggestedForYou.tr,
          style: CommonUI.customNeuMorphismStyle(
            color: AppColors.black.withValues(alpha: 0.6),
            shadowDarkColor: Colors.black26,
            shadowLightColor: Colors.transparent,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: AppFontSizes.font14,
            fontFamily: AppFonts.fontRegular,
          ),
        ),
      ],
    ),
  );
}
