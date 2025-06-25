import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/app_shimmers.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/strings.dart';
import 'package:heart_sync/pages/dashboard/detail_page/widgets_detail_page.dart';
import 'package:heart_sync/pages/dashboard/swipe/swipe_controller.dart';
import 'package:heart_sync/pages/dashboard/swipe/widgets/swipe_widgets.dart';
import 'package:heart_sync/pages/dashboard/dashboard_main/widgets_dashboard.dart';

/// A view that displays a swipe card.
class SwipeView extends GetView<SwipeController> {
  const SwipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.background,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
          title: CommonUI.neumorphicText(
            Strings.textFindMatch.tr,
            fontSize: AppFontSizes.font20,
            fontFamily: AppFonts.fontSemiBold,
            color: AppColors.pink,
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return AppShimmers.swipeCardShimmer(height: Get.height * 0.68);
          }

          if (controller.users.length <= 1) {
            return Center(
              child: CommonUI.neumorphicText(
                Strings.textNoUsersFound.tr,
                fontSize: AppFontSizes.font20,
                fontFamily: AppFonts.fontSemiBold,
                color: AppColors.black,
              ),
            );
          }

          return Column(
            children: [
              Flexible(
                child: CardSwiper(
                  controller: controller.swiperController,
                  allowedSwipeDirection: AllowedSwipeDirection.symmetric(
                    horizontal: true,
                  ),
                  scale: 0.6,
                  padding: EdgeInsets.only(
                    left: AppConstants.hzPadding,
                    right: AppConstants.hzPadding,
                    top: 20,
                  ),
                  cardsCount: controller.users.length,
                  cardBuilder: (
                    context,
                    index,
                    percentThresholdX,
                    percentThresholdY,
                  ) {
                    final user = controller.users[index];
                    String? overlayText;
                    Color? overlayColor;

                    if (percentThresholdX > 0.3) {
                      overlayText = Strings.textLike.tr;
                      overlayColor = AppColors.colorGreen;
                    } else if (percentThresholdX < -0.3) {
                      overlayText = Strings.textNope.tr;
                      overlayColor = AppColors.red;
                    }

                    return Stack(
                      children: [
                        mateImg(
                          imageUrl: AppConstants.tempImgUrl,
                          name: user.name,
                          height: Get.height * 0.68,
                          distance: user.distance,
                        ),
                        if (overlayText != null)
                          Positioned(
                            top: 50,
                            left:
                                overlayText == Strings.textLike.tr ? 20 : null,
                            right:
                                overlayText == Strings.textNope.tr ? 20 : null,
                            child: Text(
                              overlayText,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: overlayColor,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Spacer(),
                  acButton(
                    onTap: () {
                      controller.swiperController.swipe(
                        CardSwiperDirection.left,
                      );
                    },
                    icon: Icons.close,
                    iconColor: AppColors.black,
                  ),
                  SizedBox(width: 50),
                  acButton(
                    onTap: () {
                      controller.swiperController.swipe(
                        CardSwiperDirection.right,
                      );
                    },
                    icon: Icons.favorite,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: AppConstants.bottomSpace),
            ],
          );
        }),
      ),
    );
  }
}
