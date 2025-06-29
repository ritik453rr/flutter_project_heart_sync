import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';
import '../../dashboard_main/widgets_dashboard.dart';

/// A widget that represents a message item in the message list.
Widget messageItem({required String name, void Function()? onPressed}) {
  return NeumorphicButton(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    onPressed: onPressed,
    style: CommonUI.customNeuMorphismStyle(),
    child: Row(
      children: [
        profileImg(
          imageUrl: AppConstants.tempImgUrl,
          height: 35,
          topMargin: 0,
          intensity: 1,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeumorphicText(
              name,
              style: CommonUI.customNeuMorphismStyle(
                color: AppColors.black,
                shadowDarkColor: Colors.black26,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: AppFontSizes.font14,
                fontFamily: AppFonts.fontSemiBold,
              ),
            ),
          ],
        ),
        Spacer(),
        NeumorphicIcon(
          Icons.arrow_forward_ios,
          style: CommonUI.customNeuMorphismStyle(color: AppColors.black),
          size: 14,
        ),
      ],
    ),
  );
}

/// Widget to show when there are no messages
Widget emptyMessagesState() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.chat_bubble_outline,
          size: 80,
          color: AppColors.pink.withOpacity(0.5),
        ),
        SizedBox(height: 20),
        NeumorphicText(
          AppStrings.textNoMessagesFound.tr,
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
          AppStrings.textAddFriendsToConversation.tr,
          style: CommonUI.customNeuMorphismStyle(
            color: AppColors.black.withOpacity(0.6),
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
