import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_back_button.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/dashboard/my_profile/edit_profile/edit_profile_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

/// A function to show a bottom sheet for selecting the height
void showEditHeightSheet({
  required BuildContext context,
  required String title,
  String subTitle = "",
  Function(String)? onChanged,
  TextEditingController? heightController,
  EditProfileController? controller,
  String hintText = "",
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    constraints: BoxConstraints(maxHeight: Get.height * 0.66),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          Strings.textHeight.tr,
                          style: CommonUI.customTextStyle(
                            fontFamily: AppFonts.fontSemiBold,
                            fontSize: AppFontSizes.font18,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 6,
                      child: CustomBackButton(
                        icon: Icons.close,
                        buttonWidth: 30,
                        leftPadding: 2,
                        buttonHeight: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Here is a chance to add height to your profile.",
                    style: CommonUI.customTextStyle(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "Enter your height",
                        controller: heightController,
                        isTextInputDone: true,
                        borderRadius: 20,
                        maxLength: 5,
                        isMaxLength: true,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                    ),
                    ToggleSwitch(
                      initialLabelIndex:
                          controller?.heightUnit.value == "cm" ? 0 : 1,
                      totalSwitches: 2,
                      labels: ['cm', 'ft'],
                      minWidth: 50,
                      activeFgColor: AppColors.white,
                      activeBgColor: [AppColors.pink],
                      onToggle: (index) {
                        if (index == 0) {
                          controller?.heightUnit.value = "cm";
                        } else {
                          controller?.heightUnit.value = "ft";
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomButton(
                  width: 200,
                  text: Strings.textDone.tr,
                  onPressed: () async {
                    AppConstants.hideKeyboard();
                  },
                ),
                SizedBox(height: AppConstants.bottomSpace),
              ],
            ),
          ),
        ),
      );
    },
  );
}
