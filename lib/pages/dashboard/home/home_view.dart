import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_shimmers.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/common/custom_app_bar.dart';
import 'package:heart_sync/pages/dashboard/home/widgets/home_widgets.dart';
import 'package:heart_sync/routing/app_routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home_controller.dart';

/// A view to represent home view.
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
        title: "TEst",
        titleColor: AppColors.pink,
        shadow: false,
        hideBackButton: true,
        centerTitle: false,
        trailingIcon: Icons.person,
        onTapTrailingIcon: () {
          Get.toNamed(AppRoutes.request);
        },
      ),
      body: Obx(
        () =>
            controller.isLoading.value
                ? Column(
                  children: [
                    AppShimmers.newMatchesShimmer(),
                    SizedBox(height: 10),
                    AppShimmers.nearYouShimmer(marginTop: 10),
                  ],
                )
                : SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: controller.onRefresh,
                  child:
                      controller.userList.isEmpty
                          ? homeEmptyState(controller)
                          : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: CommonUI.neumorphicText("Test"),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: 95,
                                  child: ListView.builder(
                                    itemCount:
                                        controller.userList.length +
                                        (controller.isFetchingMore.value
                                            ? 1
                                            : 0),
                                    scrollDirection: Axis.horizontal,
                                    controller: controller.scrollController,
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    itemBuilder: (context, index) {
                                      if (index >=
                                          controller.userList.length) {
                                        return paginationLoader();
                                      }
                                      final user = controller.userList[index];
                                      return Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: CommonUI.profileImg(
                                          topMargin: 0,
                                          onTap: () {
                                            Get.toNamed(
                                              AppRoutes.detailPage,
                                              arguments: user,
                                            );
                                          },
                                          imageUrl: AppConstants.tempImgUrl,
                                          name: user.name,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 5,
                                  ),
                                  child: CommonUI.neumorphicText("Test"),
                                ),
                                SizedBox(
                                  height: Get.height * 0.6,
                                  child: PageView.builder(
                                    controller: controller.pageController,
                                    itemCount:
                                        controller.userList.length +
                                        (controller.isFetchingMore.value
                                            ? 1
                                            : 0),
                                    itemBuilder: (context, index) {
                                      if (index >=
                                          controller.userList.length) {
                                        return paginationLoader();
                                      }
                                      final user = controller.userList[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 20,
                                        ),
                                        child: CommonUI.mateImg(
                                          marginTop: 10,
                                          onTap: () {
                                            Get.toNamed(
                                              AppRoutes.detailPage,
                                              arguments: user,
                                            );
                                          },
                                          imageUrl: AppConstants.tempImgUrl,
                                          name: user.name,
                                          distance: user.distance,
                                          height: Get.height * 0.6,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                ),
      ),
    );
  }
}
