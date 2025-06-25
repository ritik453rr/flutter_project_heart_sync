import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';

/// A Widget that displays a custom profile item.
Widget customEditProfileItems({
  String title = "",
  String subTitle = "",
  IconData? icon,
  Function()? onPressed,
  String label = "",
  double bottomSpace = 20.0,
  int flex = 0,
  Color titleColor = AppColors.black,
  bool showSubTitle = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      label.isEmpty
          ? SizedBox()
          : Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
            child: Text(
              label.toString(),
              style: CommonUI.customTextStyle(
                fontFamily: AppFonts.fontSemiBold,
              ),
            ),
          ),
      label.isEmpty ? SizedBox(height: 0) : SizedBox(height: 16),
      Container(
        margin: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
        width: Get.width,
        height: 48,
        child: NeumorphicButton(
          provideHapticFeedback: true,
          padding: EdgeInsets.symmetric(horizontal: 16),
          onPressed: () => onPressed!(),
          style: CommonUI.customNeuMorphismStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          ),
          child: Row(
            children: [
              Icon(icon, size: 24),
              SizedBox(width: 10),
              Expanded(
                flex: flex,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  title.toString(),
                  style: CommonUI.customTextStyle(
                    color: subTitle.isEmpty ? titleColor : AppColors.black,
                  ),
                ),
              ),
              showSubTitle
                  ? Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        subTitle.toString(),
                        style: CommonUI.customTextStyle(color: AppColors.gray),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  : SizedBox(),
              showSubTitle ? SizedBox(width: 6) : SizedBox(),
              Icon(Icons.arrow_forward_ios_rounded, size: 18),
            ],
          ),
        ),
      ),
      SizedBox(height: bottomSpace),
    ],
  );
}
