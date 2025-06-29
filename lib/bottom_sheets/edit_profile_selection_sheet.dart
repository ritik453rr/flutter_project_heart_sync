import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_back_button.dart';
import 'package:heart_sync/common/custom_button.dart';
import 'package:heart_sync/language/app_strings.dart';

/// A function to show a bottom sheet for editing profile selection with chips.
void showEditProfileSelectionBottomSheet({
  required BuildContext context,
  required String title,
  String subTitle = "",
  bool isSingleSelection = false,
  required List<String> options,
  required RxList<String> selectedOptions,
  void Function(List<String>)? onDonePressed,
}) async {
  final RxList<String> tempSelectedOptions = selectedOptions.toList().obs;
  //AppStorage appStorage = AppStorage();
  // final EditProfileController controller = Get.find();

  // String uUid = appStorage.getFirebaseUUiD();

  // UserDataModel userDataModel = UserDataModel();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const SizedBox(height: 5),
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      title,
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
            if (subTitle.isNotEmpty)
              Text(subTitle, style: CommonUI.customTextStyle()),
            const SizedBox(height: 20),
            Obx(() {
              return Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10.0,
                  runSpacing: 14.0,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: List.generate(options.length, (index) {
                    final option = options[index];
                    final isSelected = tempSelectedOptions.contains(option);
                    return Neumorphic(
                      style: CommonUI.customNeuMorphismStyle(),
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      child: ChoiceChip(
                        label: Text(option),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        showCheckmark: false,
                        selected: isSelected,
                        onSelected: (selected) {
                          if (isSingleSelection) {
                            tempSelectedOptions.clear();
                          }
                          if (selected) {
                            tempSelectedOptions.add(option);
                          } else {
                            tempSelectedOptions.remove(option);
                          }
                        },
                        selectedColor: AppColors.pink,
                        backgroundColor: AppColors.gray,
                        labelStyle: CommonUI.customTextStyle(
                          color: isSelected ? Colors.white : AppColors.black,
                        ),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                    );
                  }),
                ),
              );
            }),
            const SizedBox(height: 40),
            CustomButton(
              width: 200,
              text: AppStrings.textDone.tr,
              onPressed: () async {},
            ),
            const SizedBox(height: AppConstants.bottomSpace),
          ],
        ),
      );
    },
  );
}
