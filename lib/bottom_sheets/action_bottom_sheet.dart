import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';

/// A bottom sheet that shows a list of actions.
class ActionBottomSheet {
  /// A method to show the bottom sheet.
  Future<void> showBottomSheet({
    void Function()? onTapBlock,
    void Function()? onTapReport,
    void Function()? onTapShare,
  }) {
    return Get.bottomSheet(
      isScrollControlled: false,
      Container(
        width: Get.width,
        decoration: CommonUI.borderDecoration(topLeft: 20, topRight: 20),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  actionSheetItem(
                    title: AppStrings.textShare.tr,
                    onTap: onTapShare,
                  ),
                  actionSheetItem(
                    title: AppStrings.textBlock.tr,
                    color: AppColors.red,
                    onTap: onTapBlock,
                  ),
                  actionSheetItem(
                    title: AppStrings.textReport.tr,
                    color: AppColors.red,
                    onTap: onTapReport,
                  ),
                  actionSheetItem(
                    title: AppStrings.textCancel.tr,
                    isLast: true,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A function to build action sheet item.
Widget actionSheetItem({
  required String title,
  Color color = AppColors.black,
  bool isLast = false,
  void Function()? onTap,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: Column(
      children: [
        CommonUI.neumorphicText(
          title,
          fontSize: AppFontSizes.font18,

          color: color,
        ),
        isLast
            ? SizedBox()
            : Divider(
              thickness: 0.5,
              color: Colors.black.withOpacity(0.2),
              height: 50,
            ),
      ],
    ),
  );
}
