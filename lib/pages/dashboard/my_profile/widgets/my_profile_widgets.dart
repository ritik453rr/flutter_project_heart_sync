import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/common_ui.dart';

/// A Widget that displays a custom profile item.
Widget customProfileItems({
  String? title,
  IconData? icon,
  Function()? onPressed,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
    width: Get.width,
    height: 48,
    child: NeumorphicButton(
      provideHapticFeedback: true,
      onPressed: () => onPressed!(),
      style: CommonUI.customNeuMorphismStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(title.toString(), style: CommonUI.customTextStyle()),
        ],
      ),
    ),
  );
}
