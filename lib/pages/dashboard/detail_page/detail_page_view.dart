import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/bottom_sheets/action_bottom_sheet.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/dashboard/detail_page/detail_page_controller.dart';
import 'package:heart_sync/pages/dashboard/detail_page/widgets_detail_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// A page that displays the details of a user.
class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: "Age Name",
        centerTitle: false,
        trailingIcon: Icons.more_horiz,
        onTapTrailingIcon: () {
          ActionBottomSheet().showBottomSheet();
        },
        titleColor: AppColors.pink,
        titleFontSize: AppFontSizes.font20,
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: () {
          controller.refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              images(detailPageController: controller, borderRadius: 20),
              // About Section Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CommonUI.neumorphicText(Strings.textAboutMe.tr),
              ),
              // Info Sections Container
              Neumorphic(
                margin: const EdgeInsets.all(16),
                style: NeumorphicStyle(
                  depth: 4,
                  intensity: 0.7,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15),
                  ),
                  color: AppColors.background,
                ),
                child: Column(
                  children: [
                    aboutSection(controller),
                    basicInfoSection(controller),
                    essentialsSection(controller),
                    preferencesSection(controller),
                    interestsSection(controller),
                  ],
                ),
              ),

              // Action Buttons Container
              Neumorphic(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                style: CommonUI.customNeuMorphismStyle(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      // Add Friend Button
                      Obx(
                        () => NeumorphicButton(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          style: CommonUI.customNeuMorphismStyle(),
                          onPressed: () {},
                        ),
                      ),

                      // Block Button
                      NeumorphicButton(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        style: CommonUI.customNeuMorphismStyle(),
                        onPressed: () {
                          blockDialog(subTitle: "Block");
                        },
                        child: Center(
                          child: CommonUI.neumorphicText(
                            "Block",
                            color: AppColors.red,
                            fontSize: AppFontSizes.font16,
                          ),
                        ),
                      ),

                      // Report Button
                      NeumorphicButton(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        style: CommonUI.customNeuMorphismStyle(),
                        onPressed: () {},
                        child: Center(
                          child: CommonUI.neumorphicText(
                            "Report",
                            color: AppColors.red,
                            fontSize: AppFontSizes.font16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppConstants.bottomSpace),
            ],
          ),
        ),
      ),
    );
  }
}
