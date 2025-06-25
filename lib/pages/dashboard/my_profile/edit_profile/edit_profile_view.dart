import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/bottom_sheets/edit_height_bottom_sheet.dart';
import 'package:heart_sync/bottom_sheets/edit_profile_selection_sheet.dart';
import 'package:heart_sync/common/common_ui.dart' show CommonUI;
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/common/custom_image_picker.dart';
import 'package:heart_sync/common/custom_textfield.dart';
import 'package:heart_sync/common/static_resources.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/dashboard/my_profile/edit_profile/edit_profile_controller.dart';
import 'package:heart_sync/pages/dashboard/my_profile/edit_profile/widgets/edit_profile_widgets.dart';

/// EditProfileView class is used to edit the profile of the user
class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final EditProfileController controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppConstants.hideKeyboard(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Strings.textEditProfile.tr,
          trailingIcon: Icons.check,
          onTapTrailingIcon: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              CustomImagePicker(
                selectedImages: controller.selectedImages,
                onImageSelected:
                    (index, pickedImages) =>
                        controller.setImageAt(index, pickedImages),
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: AppConstants.hzPadding),
                child: Text(
                  Strings.textAboutMe.tr,
                  style: CommonUI.customTextStyle(
                    fontFamily: AppFonts.fontSemiBold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: controller.aboutMeController,
                hintText: Strings.textAboutMe.tr,
                borderRadius: 10,
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Obx(() {
                return customEditProfileItems(
                  label: Strings.textInterests.tr,
                  title:
                      controller.selectedInterests.isEmpty
                          ? Strings.textAddInterests.tr
                          : controller.selectedInterests.join(", "),
                  icon: Icons.interests,
                  flex: 9,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textInterests.tr,
                      subTitle:
                          "Let us know what sparks your interest so we can tailor your experience just for you.",
                      selectedOptions: controller.selectedInterests,
                      options: StaticResources.interestOptionList,
                      onDonePressed:
                          (updated) =>
                              controller.selectedInterests.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  label: Strings.textPronouns.tr,
                  title:
                      controller.selectedPronouns.isEmpty
                          ? Strings.textAddPronouns.tr
                          : controller.selectedPronouns.join(", "),
                  icon: CupertinoIcons.profile_circled,
                  flex: 9,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textPronouns.tr,
                      subTitle:
                          "Select up to 4 pronouns and add them to your profile",
                      options: StaticResources.pronounsList,
                      selectedOptions: controller.selectedPronouns,
                      onDonePressed:
                          (updated) =>
                              controller.selectedPronouns.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                final height = controller.userHeight;
                final unit = controller.heightUnit.value;
                return customEditProfileItems(
                  label: Strings.textHeight.tr,
                  title:
                      height.isEmpty
                          ? Strings.textAddHeight.tr
                          : "$height $unit",
                  icon: Icons.height,
                  onPressed: () {
                    showEditHeightSheet(
                      context: context,
                      title: Strings.textHeight.tr,
                      heightController: controller.heightController,
                      onChanged: (value) => controller.updateUserHeight(value),
                      controller: controller,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  label: Strings.textRelationShipType.tr,
                  title:
                      controller.selectedRelationshipType.isEmpty
                          ? Strings.textOpenTo.tr
                          : controller.selectedRelationshipType.join(", "),
                  icon: CupertinoIcons.eye,
                  flex: 9,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textRelationShipType.tr,
                      subTitle: "What type of relationship are you open to?",
                      selectedOptions: controller.selectedRelationshipType,
                      options: StaticResources.relationshipStatusList,
                      onDonePressed:
                          (updated) =>
                              controller.selectedRelationshipType.value =
                                  updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  label: Strings.textLanguages.tr,
                  title:
                      controller.selectedLanguages.isEmpty
                          ? Strings.textLanguages.tr
                          : controller.selectedLanguages.join(", "),
                  icon: Icons.language,
                  flex: 9,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: "Languages I Know",
                      subTitle:
                          "Select up to 4 languages and add them to your profile",
                      options: StaticResources.languageList,
                      selectedOptions: controller.selectedLanguages,
                      onDonePressed:
                          (updated) =>
                              controller.selectedLanguages.value = updated,
                    );
                  },
                );
              }),

              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: AppConstants.hzPadding),
                child: Text(
                  Strings.textBasic.tr,
                  style: CommonUI.customTextStyle(
                    fontFamily: AppFonts.fontSemiBold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textZodiac.tr,
                  icon: Icons.star,
                  subTitle:
                      controller.selectedZodiac.isEmpty
                          ? "Empty"
                          : controller.selectedZodiac.join(", "),
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textZodiac.tr,
                      subTitle: "Select your Zodiac sign",
                      options: StaticResources.zodiacList,
                      selectedOptions: controller.selectedZodiac,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedZodiac.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textEducation.tr,
                  subTitle:
                      controller.selectedEducation.isEmpty
                          ? "Empty"
                          : controller.selectedEducation.join(", "),
                  icon: Icons.school_outlined,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textEducation.tr,
                      subTitle: "Select your education level",
                      options: StaticResources.educationList,
                      selectedOptions: controller.selectedEducation,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedEducation.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textFamilyPlans.tr,
                  subTitle:
                      controller.selectedFamilyPlan.isEmpty
                          ? "Empty"
                          : controller.selectedFamilyPlan.join(", "),
                  icon: Icons.family_restroom,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textFamilyPlans.tr,
                      subTitle:
                          "Looking for someone on the same page? Start by sharing your family goals.",
                      options: StaticResources.familyPlanList,
                      selectedOptions: controller.selectedFamilyPlan,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedFamilyPlan.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textCovidVaccine.tr,
                  subTitle:
                      controller.selectedCovidVaccination.isEmpty
                          ? "Empty"
                          : controller.selectedCovidVaccination.join(""),
                  icon: Icons.healing,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textCovidVaccine.tr,
                      subTitle:
                          "It’s a small detail that can make a big difference — be open about your vaccination status.",
                      options: StaticResources.covidStatusList,
                      selectedOptions: controller.selectedCovidVaccination,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedCovidVaccination.value =
                                  updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textPersonalityType.tr,
                  subTitle:
                      controller.selectedPersonality.isEmpty
                          ? "Empty"
                          : controller.selectedPersonality.join(""),
                  icon: Icons.personal_injury_sharp,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textPersonalityType.tr,
                      subTitle:
                          "Your personality is your power — let it shine through your profile.",
                      options: StaticResources.personalityTypeList,
                      selectedOptions: controller.selectedPersonality,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedPersonality.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textCommunicationStyle.tr,
                  subTitle:
                      controller.selectedCommunication.isEmpty
                          ? "Empty"
                          : controller.selectedCommunication.join(""),
                  icon: CupertinoIcons.chat_bubble_text,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textCommunicationStyle.tr,
                      subTitle: "Select your communication style",
                      options: StaticResources.communicationStyleList,
                      selectedOptions: controller.selectedCommunication,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedCommunication.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textLoveStyle.tr,
                  subTitle:
                      controller.selectedLoveStyle.isEmpty
                          ? "Empty"
                          : controller.selectedLoveStyle.join(""),
                  icon: CupertinoIcons.heart_circle,
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textLoveStyle.tr,
                      subTitle: "Select your love style",
                      options: StaticResources.loveStyleList,
                      selectedOptions: controller.selectedLoveStyle,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedLoveStyle.value = updated,
                    );
                  },
                );
              }),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: AppConstants.hzPadding),
                child: Text(
                  Strings.textLifeStyle.tr,
                  style: CommonUI.customTextStyle(
                    fontFamily: AppFonts.fontSemiBold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textPets.tr,
                  icon: Icons.pets,
                  subTitle:
                      controller.selectedPets.isEmpty
                          ? "Empty"
                          : controller.selectedPets.join(", "),
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textPets.tr,
                      subTitle: "Select your pets",
                      options: StaticResources.petList,
                      selectedOptions: controller.selectedPets,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) => controller.selectedPets.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textDrinking.tr,
                  icon: Icons.local_bar,
                  subTitle:
                      controller.selectedDrinking.isEmpty
                          ? "Empty"
                          : controller.selectedDrinking.join(", "),
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textDrinking.tr,
                      subTitle: "Select your drinking habits",
                      options: StaticResources.drinkingList,
                      selectedOptions: controller.selectedDrinking,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedDrinking.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textSmoking.tr,
                  icon: Icons.smoking_rooms,
                  subTitle:
                      controller.selectedSmoking.isEmpty
                          ? "Empty"
                          : controller.selectedSmoking.join(", "),
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textSmoking.tr,
                      subTitle: "Select your smoking habits",
                      options: StaticResources.smokingList,
                      selectedOptions: controller.selectedSmoking,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedSmoking.value = updated,
                    );
                  },
                );
              }),
              Obx(() {
                return customEditProfileItems(
                  title: Strings.textWorkOut.tr,
                  icon: Icons.fitness_center,
                  subTitle:
                      controller.selectedWorkOut.isEmpty
                          ? "Empty"
                          : controller.selectedWorkOut.join(", "),
                  onPressed: () {
                    showEditProfileSelectionBottomSheet(
                      context: context,
                      title: Strings.textWorkOut.tr,
                      subTitle: "Select Workout Habits",
                      options: StaticResources.workOutList,
                      selectedOptions: controller.selectedWorkOut,
                      isSingleSelection: true,
                      onDonePressed:
                          (updated) =>
                              controller.selectedWorkOut.value = updated,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
