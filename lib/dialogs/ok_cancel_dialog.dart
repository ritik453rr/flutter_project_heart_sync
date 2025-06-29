import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';

/// A Custom Alert Dialog that shows a message and has two buttons: Yes and No.
class OkCancelDialog {
  customAlertBox({
    required String title,
    required String subTitle,
    String confirmButtonText = "Yes",
    String cancelButtonText = "No",
    void Function()? onConfirmPressed,
    IconData icon = CupertinoIcons.square_arrow_right,
  }) {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Neumorphic(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(26),
                    style: CommonUI.customNeuMorphismStyle(
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    child: Center(child: Icon(icon, color: AppColors.red)),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: CommonUI.customTextStyle(
                            fontSize: AppFontSizes.font18,
                            fontFamily: AppFonts.fontSemiBold,
                          ),
                        ),
                        SizedBox(height: title.isEmpty ? 0 : 10),
                        Text(
                          subTitle,
                          textAlign: TextAlign.center,
                          style: CommonUI.customTextStyle(
                            fontFamily: AppFonts.fontRegular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Neumorphic(
                style: CommonUI.customNeuMorphismStyle(),
                child: SizedBox(width: Get.width, height: 5),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: onConfirmPressed,
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Neumorphic(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              style: CommonUI.customNeuMorphismStyle(),
                              child: Text(
                                AppStrings.textYes.tr,
                                style: CommonUI.customTextStyle(
                                  fontFamily: AppFonts.fontMedium,
                                  fontSize: AppFontSizes.font16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Neumorphic(
                      style: CommonUI.customNeuMorphismStyle(),
                      child: SizedBox(height: 50, width: 5),
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.back(),
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Neumorphic(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              style: CommonUI.customNeuMorphismStyle(),
                              child: Text(
                                AppStrings.textNo.tr,
                                style: CommonUI.customTextStyle(
                                  fontFamily: AppFonts.fontMedium,
                                  fontSize: AppFontSizes.font16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
