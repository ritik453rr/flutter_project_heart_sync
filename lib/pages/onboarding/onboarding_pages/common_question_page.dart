import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/model/question_model.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// A page that displays a list of questions and options for the user to answer.
class CommonQuestionPage extends GetView<OnboardingController> {
  final String title;
  final String subTitle;
  final List<QuestionModel> questionList;
  final bool? isLikePage;
  bool? isMultipleSelection = false;

  CommonQuestionPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.questionList,
    this.isLikePage = false,
    this.isMultipleSelection = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingController>(
        builder:
            (_) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.hzPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: CommonUI.customTextStyle(
                            fontFamily: AppFonts.fontBold,
                            fontSize: AppFontSizes.font20,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(subTitle, style: CommonUI.customTextStyle()),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child:
                        isLikePage == true
                            ? SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 30,
                                  top: 15,
                                  left: AppConstants.hzPadding,
                                  right: AppConstants.hzPadding,
                                ),
                                child: Column(
                                  children:
                                      questionList.map((item) {
                                        return Wrap(
                                          alignment: WrapAlignment.start,
                                          runSpacing: 12,
                                          children:
                                              item.options.map((option) {
                                                final isSelected =
                                                    controller
                                                        .getSelectedOption(
                                                          item.title,
                                                        ) ==
                                                    option;
                                                return NeumorphicButton(
                                                  provideHapticFeedback: true,
                                                  pressed: true,
                                                  onPressed: () {
                                                    controller.selectAnswer(
                                                      item.title,
                                                      option,
                                                    );
                                                  },
                                                  style:
                                                      CommonUI.customNeuMorphismStyle(),
                                                  padding: EdgeInsets.zero,
                                                  margin: EdgeInsets.only(
                                                    right: 16,
                                                  ),
                                                  child: ChoiceChip(
                                                    label: Text(
                                                      option,
                                                      style:
                                                          CommonUI.customTextStyle(),
                                                    ),
                                                    showCheckmark: false,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    selected: isSelected,
                                                    onSelected: (_) {
                                                      if (isMultipleSelection ==
                                                          true) {
                                                        controller.selectAnswer(
                                                          item.title,
                                                          option,
                                                        );
                                                      } else {
                                                        controller.selectAnswer(
                                                          item.title,
                                                          option,
                                                        );
                                                      }
                                                    },
                                                    selectedColor:
                                                        AppColors.colorPrimary,
                                                    backgroundColor:
                                                        AppColors.white,
                                                    labelStyle:
                                                        CommonUI.customTextStyle(
                                                          color:
                                                              isSelected
                                                                  ? Colors.white
                                                                  : AppColors
                                                                      .black,
                                                        ),
                                                    side: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                        );
                                      }).toList(),
                                ),
                              ),
                            )
                            : ListView.separated(
                              padding: EdgeInsets.only(
                                bottom: 30,
                                left: AppConstants.hzPadding,
                                right: AppConstants.hzPadding,
                              ),
                              separatorBuilder:
                                  (_, __) => Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Divider(),
                                  ),
                              itemCount: questionList.length,
                              itemBuilder: (context, index) {
                                final item = questionList[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(item.icon),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Text(
                                            item.title,
                                            style: CommonUI.customTextStyle(
                                              fontSize: AppFontSizes.font18,
                                              fontFamily: AppFonts.fontBold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Wrap(
                                      alignment: WrapAlignment.start,
                                      spacing: 10,
                                      runSpacing: 12,
                                      children:
                                          item.options.map((option) {
                                            final isSelected =
                                                controller.getSelectedOption(
                                                  item.title,
                                                ) ==
                                                option;
                                            return NeumorphicButton(
                                              provideHapticFeedback: true,
                                              pressed: true,
                                              onPressed: () {
                                                controller.selectAnswer(
                                                  item.title,
                                                  option,
                                                );
                                              },
                                              style:
                                                  CommonUI.customNeuMorphismStyle(),
                                              padding: EdgeInsets.zero,
                                              margin: EdgeInsets.zero,
                                              child: ChoiceChip(
                                                label: Text(option),
                                                showCheckmark: false,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                selected: isSelected,
                                                onSelected:
                                                    (_) =>
                                                        controller.selectAnswer(
                                                          item.title,
                                                          option,
                                                        ),
                                                selectedColor:
                                                    AppColors.colorPrimary,
                                                backgroundColor:
                                                    AppColors.white,
                                                labelStyle:
                                                    CommonUI.customTextStyle(
                                                      color:
                                                          isSelected
                                                              ? Colors.white
                                                              : AppColors.black,
                                                    ),
                                                side: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                    ),
                                  ],
                                );
                              },
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 65),
                    child: Divider(),
                  ),
                  const SizedBox(height: AppConstants.bottomSpace),
                ],
              ),
            ),
      ),
    );
  }
}
