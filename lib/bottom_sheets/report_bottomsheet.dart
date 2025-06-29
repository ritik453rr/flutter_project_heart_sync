import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/pages/dashboard/detail_page/detail_page_controller.dart';
import '../common/app_colors.dart';
import '../common/common_ui.dart';
import 'action_bottom_sheet.dart';

class ReportBottomSheet {
  Future showSheet({required DetailPageController controller}) {
    return Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: Get.height * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            actionSheetItem(title: AppStrings.textSelectReasonToBlock.tr),
            Expanded(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: controller.reasons.length,
                itemBuilder: (context, index) {
                  final reason = controller.reasons[index];
                  return Obx(() {
                    return NeumorphicButton(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      onPressed: () {},
                      style: CommonUI.customNeuMorphismStyle(
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            reason,
                            style: TextStyle(
                              fontSize: AppFontSizes.font16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            NeumorphicButton(
              onPressed: () {
                Get.back();
              },
              margin: const EdgeInsets.only(left: 20, right: 20),
              style: CommonUI.customNeuMorphismStyle(color: AppColors.red),
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  AppStrings.textReportUser.tr,
                  style: const TextStyle(
                    fontSize: AppFontSizes.font16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
