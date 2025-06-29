import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/dialogs/ok_cancel_dialog.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'detail_page_controller.dart';

/// A widget that displays a cached network image with a neumorphic style.
Widget images({
  double borderRadius = 20,
  required DetailPageController detailPageController,
}) {
  return SizedBox(
    height: Get.height * 0.6,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Image PageView
        PageView.builder(
          itemCount: 10,
          controller: detailPageController.pageController,
          onPageChanged: (index) {},
          itemBuilder: (context, index) {
            final imageUrl = AppConstants.tempImgUrl;
            // detailPageController.user.imageUrls.isNotEmpty
            //     ? detailPageController.user.imageUrls[index]
            //     : '';
            return GestureDetector(
              child: CommonUI.mateImg(
                showDetails: false,
                marginTop: 20,
                marginLeft: 20,
                marginBottom: 10,
                marginRight: 20,
                imageUrl: imageUrl,
                name: "Name",
                distance: "Distance",
                height: Get.height * 0.6,
              ),
            );
          },
        ),

        // Page Indicator
        // if (detailPageController.user.imageUrls.isNotEmpty &&
        //     detailPageController.user.imageUrls.length > 1)
        //   Positioned(
        //     bottom: 50,
        //     child: SmoothPageIndicator(
        //       controller: detailPageController.pageController,
        //       count: detailPageController.user.imageUrls.length,
        //       axisDirection: Axis.horizontal,
        //       effect: ScrollingDotsEffect(
        //         activeDotColor: AppColors.colorPink.withOpacity(0.8),
        //         dotColor: AppColors.colorWhite.withOpacity(0.7),
        //         dotHeight: 6,
        //         dotWidth: 6,
        //         spacing: 3,
        //         activeDotScale: 1.2,
        //       ),
        //     ),
        //   ),
      ],
    ),
  );
}

/// Widget for About section
Widget aboutSection(DetailPageController controller) {
  return Neumorphic(
    margin: const EdgeInsets.all(12),
    style: CommonUI.customNeuMorphismStyle(),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeading(
          icon: Icons.format_quote_rounded,
          title: AppStrings.textAboutMe.tr,
        ),
        const SizedBox(height: 5),
        CommonUI.neumorphicText(
          textAlign: TextAlign.start,
          AppStrings.textNoBioAdded.tr,
          fontSize: AppFontSizes.font14,
        ),
      ],
    ),
  );
}

/// Widget for Basic Info section
Widget basicInfoSection(DetailPageController controller) {
  return Neumorphic(
    margin: const EdgeInsets.all(12),
    style: CommonUI.customNeuMorphismStyle(),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeading(icon: Icons.person, title: AppStrings.textBasicInfo.tr),
        const SizedBox(height: 12),
        infoItem(icon: Icons.cake, text: "Dob"),
        // if (controller.user.gender.isNotEmpty) ...[
        //   const SizedBox(height: 8),
        //   infoItem(icon: Icons.person_outline, text: controller.user.gender),
        // ],
        // if (controller.user.pronouns.isNotEmpty) ...[
        //   const SizedBox(height: 16),
        //   CommonUI.neumorphicText(
        //     Strings.textPronouns.tr,
        //     fontSize: AppFontSizes.font14,
        //   ),
        //   const SizedBox(height: 8),
        //   pronounsSection(controller.user.pronouns),
        // ],
      ],
    ),
  );
}

/// Widget for Essentials section
Widget essentialsSection(DetailPageController controller) {
  return Neumorphic(
    margin: const EdgeInsets.all(12),
    style: CommonUI.customNeuMorphismStyle(),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeading(
          icon: Icons.info_outline,
          title: AppStrings.textEssentials.tr,
        ),
        const SizedBox(height: 12),
        //if (controller.user.distance > 0)
        infoItem(
          icon: Icons.location_on,
          text: " Test ${AppStrings.textKmAway.tr}",
        ),
        if (true) ...[
          const SizedBox(height: 8),
          infoItem(icon: Icons.school, text: "Test"),
        ],
        if (true) ...[
          const SizedBox(height: 8),
          infoItem(icon: Icons.height, text: "5"),
        ],
        if (true) ...[
          const SizedBox(height: 8),
          infoItem(icon: Icons.language, text: "Hindi", isLast: true),
        ],
      ],
    ),
  );
}

/// Widget for Preferences section
Widget preferencesSection(DetailPageController controller) {
  return Neumorphic(
    margin: const EdgeInsets.all(12),
    style: CommonUI.customNeuMorphismStyle(),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeading(
          icon: Icons.favorite,
          title: AppStrings.textPreferences.tr,
        ),
        const SizedBox(height: 12),
        if (true) infoItem(icon: Icons.search, text: "Long Term"),
        if (true) ...[
          const SizedBox(height: 8),
          infoItem(icon: Icons.favorite_border, text: "Test"),
        ],
        if (true) ...[
          const SizedBox(height: 8),
          infoItem(icon: Icons.family_restroom, text: "Test", isLast: true),
        ],
      ],
    ),
  );
}

/// Widget for Interests section
Widget interestsSection(DetailPageController controller) {
  return Neumorphic(
    margin: const EdgeInsets.all(12),
    style: CommonUI.customNeuMorphismStyle(),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeading(
          icon: Icons.interests,
          title: AppStrings.textInterests.tr,
        ),
      ],
    ),
  );
}

/// Widget for Action Buttons section
Widget actionButtonsSection(DetailPageController controller) {
  return Column(
    children: [
      Neumorphic(
        style: CommonUI.customNeuMorphismStyle(
          depth: 4,
          intensity: 0.8,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppConstants.hzPadding,
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            actionButton(
              title: " Add ",
              color: AppColors.black,
              onPressed: () {},
            ),
            actionButton(
              title: "Block ",
              onPressed: () {
                blockDialog(subTitle: "Block");
              },
            ),
            actionButton(title: "Report", onPressed: () {}),
          ],
        ),
      ),
      SizedBox(height: AppConstants.bottomSpace),
    ],
  );
}

/// Widget to display user's pronouns
Widget pronounsSection(List<String> pronouns) {
  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children:
        pronouns
            .map(
              (pronoun) => Neumorphic(
                style: CommonUI.customNeuMorphismStyle(depth: 3),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: CommonUI.neumorphicText(
                  pronoun,
                  fontSize: AppFontSizes.font12,
                ),
              ),
            )
            .toList(),
  );
}

/// Widget for user likes/interests
Widget userLikes(List<String> likes) {
  return Wrap(
    spacing: 10,
    runSpacing: 10,
    children:
        likes
            .map(
              (option) => Neumorphic(
                style: CommonUI.customNeuMorphismStyle(depth: 3),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: CommonUI.neumorphicText(
                  option,
                  fontSize: AppFontSizes.font12,
                ),
              ),
            )
            .toList(),
  );
}

/// A function to build info item
Widget infoItem({
  required IconData icon,
  required String text,
  bool isLast = false,
}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 5),
    decoration: BoxDecoration(
      border:
          isLast
              ? null
              : Border(
                bottom: BorderSide(
                  color: AppColors.black.withOpacity(0.1),
                  width: 1,
                ),
              ),
    ),
    child: Row(
      children: [
        NeumorphicIcon(
          icon,
          size: 20,
          style: CommonUI.customNeuMorphismStyle(
            color: AppColors.black,
            depth: 1,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: CommonUI.neumorphicText(
            textAlign: TextAlign.start,
            text,
            fontSize: AppFontSizes.font14,
          ),
        ),
      ],
    ),
  );
}

/// A function to build a section heading with an icon and text
Widget sectionHeading({
  IconData? icon,
  required String title,
  void Function()? onTapMore,
}) {
  return Row(
    children: [
      if (icon != null) ...[
        NeumorphicIcon(
          icon,
          size: 20,
          style: CommonUI.customNeuMorphismStyle(
            color: AppColors.black,
            depth: 1,
          ),
        ),
        const SizedBox(width: 12),
      ],
      Flexible(
        child: CommonUI.neumorphicText(title, fontSize: AppFontSizes.font16),
      ),
    ],
  );
}

/// A method to build action button
Widget actionButton({
  required String title,
  Color color = AppColors.red,
  void Function()? onPressed,
}) {
  return SizedBox(
    width: Get.width,
    child: NeumorphicButton(
      onPressed: onPressed,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.hzPadding,
        vertical: 20,
      ),
      style: CommonUI.customNeuMorphismStyle(),
      child: CommonUI.neumorphicText(title, fontSize: AppFontSizes.font14),
    ),
  );
}

/// A method to build a block dialog.
blockDialog({required String subTitle}) {
  return OkCancelDialog().customAlertBox(
    title: AppStrings.textBlock.tr,
    subTitle: subTitle,
    icon: Icons.block,
  );
}

/// Widget to display Q&A sections (lifestyle and thought answers)
Widget qaSection({
  required String title,
  required Map<String, String> answers,
  required IconData icon,
}) {
  if (answers.isEmpty) return const SizedBox.shrink();

  return Neumorphic(
    margin: EdgeInsets.symmetric(
      horizontal: AppConstants.hzPadding,
      vertical: 10,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: AppConstants.hzPadding,
      vertical: 15,
    ),
    style: CommonUI.customNeuMorphismStyle(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeading(icon: icon, title: title),
        const SizedBox(height: 10),
        ...answers.entries
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(
                        fontFamily: AppFonts.fontSemiBold,
                        fontSize: AppFontSizes.font14,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entry.value,
                      style: TextStyle(
                        fontFamily: AppFonts.fontRegular,
                        fontSize: AppFontSizes.font14,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    ),
  );
}

/// Widget to display vaccination status
Widget vaccinationStatus(String status) {
  return Neumorphic(
    style: CommonUI.customNeuMorphismStyle(),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.medical_services_outlined, size: 18),
        const SizedBox(width: 8),
        Text(
          status,
          style: TextStyle(
            fontFamily: AppFonts.fontMedium,
            fontSize: AppFontSizes.font14,
          ),
        ),
      ],
    ),
  );
}
