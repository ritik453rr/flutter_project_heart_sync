import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:shimmer/shimmer.dart';

/// A class that provides shimmer effects for loading states.
class AppShimmers {
  /// Shows a shimmer effect for a card
  static Widget swipeCardShimmer({double? height, double? width}) {
    return Column(
      children: [
        Flexible(
          child: Shimmer.fromColors(
            baseColor: AppColors.gray.withValues(alpha: 0.3),
            highlightColor: AppColors.white.withValues(alpha: 0.7),
            child: Container(
              height: height,
              width: width,
              margin: const EdgeInsets.only(
                left: AppConstants.hzPadding,
                right: AppConstants.hzPadding,
                top: 20,
              ),
              decoration: CommonUI.boxDecoration(
                color: AppColors.white,
                topLeft: 20,
                topRight: 20,
                bottomLeft: 20,
                bottomRight: 20,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
           const Spacer(),
            Shimmer.fromColors(
              baseColor: AppColors.shimmerBase,
              highlightColor: AppColors.shimmerHl,
              child: Container(
                width: 50,
                height: 50,
                decoration: 
                const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(width: 50),
            Shimmer.fromColors(
              baseColor: AppColors.shimmerBase,
              highlightColor: AppColors.shimmerHl,
              child: Container(
                width: 50,
                height: 50,
                decoration:const  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: AppConstants.bottomSpace),
      ],
    );
  }

  /// Shows a shimmer effect for chat messages
  static Widget chatMessageShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHl,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 40,
          );
        },
      ),
    );
  }

  /// A method that shows a shimmer effect for the friends list.
  static Widget friendsShimmer() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHl,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 25),
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }

  /// A method that shows a shimmer effect for the near you list.
  static Widget nearYouShimmer({double marginTop = 0}) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHl,
      child: Container(
        height: Get.height * 0.56,
        width: Get.width,
        margin: EdgeInsets.only(
          left: AppConstants.hzPadding,
          right: AppConstants.hzPadding,
          top: marginTop,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
      ),
    );
  }

  /// A method that shows a shimmer effect for the new matches list.
  static Widget newMatchesShimmer() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.hzPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.shimmerBase,
            highlightColor: AppColors.shimmerHl,
            child: Container(
              height: 80,
              width: 80,
              margin:const  EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
