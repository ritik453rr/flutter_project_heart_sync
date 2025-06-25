import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/pages/dashboard/my_profile/my_profile_view.dart';
import 'package:shimmer/shimmer.dart';
import '../home/home_view.dart';
import '../message/message_view.dart';
import '../swipe/swipe_view.dart';

/// A list of widgets that represent the screens of the application.
List<Widget> screens = [
  HomeView(),
  SwipeView(),
  MessageView(),
  MyProfileView(),
];

/// A function that returns a widget with a cached network image.
Widget mateImg({
  String imageUrl = '',
  required String name,
  required distance,
  double? height,
  double marginTop = 10,
  double marginBottom = 0,
  double marginLeft = 0,
  double marginRight = 0,
  bool showDetails = true,
  void Function()? onTap,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: Stack(
      children: [
        Neumorphic(
          margin: EdgeInsets.only(
            top: marginTop,
            bottom: marginBottom,
            left: marginLeft,
            right: marginRight,
          ),
          style: CommonUI.customNeuMorphismStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: height,
              width: Get.width,
              imageUrl: imageUrl,
              placeholder:
                  (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.gray.withOpacity(0.3),
                    highlightColor: AppColors.white.withOpacity(0.7),
                    child: Container(
                      height: height,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white,
                      ),
                    ),
                  ),
              errorWidget:
                  (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: height,
                      width: Get.width,
                      imageUrl: AppConstants.emptyImgUrl,
                      placeholder:
                          (context, url) => Shimmer.fromColors(
                            baseColor: AppColors.gray.withOpacity(0.3),
                            highlightColor: AppColors.white.withOpacity(0.7),
                            child: Container(
                              height: height,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                    ),
                  ),
            ),
          ),
        ),
        showDetails
            ? Positioned(
              bottom: 20,
              left: 20,
              child: Neumorphic(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 20,
                  right: 60,
                ),
                style: CommonUI.customNeuMorphismStyle(
                  intensity: 0.8,
                  shadowLightColor: Colors.transparent,
                  color: AppColors.white.withOpacity(0.7),
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: AppFontSizes.font16,
                        fontFamily: AppFonts.fontBold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.black,
                          size: 16,
                        ),
                        Text(
                          " 3",
                          style: TextStyle(
                            fontSize: AppFontSizes.font14,
                            fontFamily: AppFonts.fontSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            : SizedBox(),
      ],
    ),
  );
}

/// A function that returns a widget with a story image.
Widget profileImg({
  String imageUrl = '',
  String name = '',
  double? height = 70,
  double topMargin = 10,
  double bottomMargin = 0,
  double rightMargin = 0,
  double leftMargin = 0,
  double padding = 2,
  void Function()? onTap,
  double intensity = 1,
}) {
  return Column(
    children: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
            top: topMargin,
            left: leftMargin,
            right: rightMargin,
            bottom: bottomMargin,
          ),
          child: Neumorphic(
            padding: EdgeInsets.all(padding),
            style: CommonUI.customNeuMorphismStyle(
              intensity: 1,
              borderWidth: 0.2,
              //shadowDarkColor: Colors.transparent,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                height: height,
                width: height,
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder:
                    (context, url) => Shimmer.fromColors(
                      baseColor: AppColors.gray.withOpacity(0.3),
                      highlightColor: AppColors.white.withOpacity(0.7),
                      child: Container(
                        height: height,
                        width: height,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      height: height,
                      width: height,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: CommonUI.neumorphicText(
                          name.isNotEmpty
                              ? name
                                  .split(' ')
                                  .map((word) => word[0].toUpperCase())
                                  .join()
                              : '',
                          fontSize: AppFontSizes.font20,
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ),
      ),
      name.isEmpty
          ? SizedBox()
          : Column(
            children: [
              SizedBox(height: 4),
              CommonUI.neumorphicText(name, fontSize: AppFontSizes.font10),
            ],
          ),
    ],
  );
}

/// A function that returns a widget with a bottom navigation bar item.
BottomNavigationBarItem bottomNavItem({
  required IconData icon,
  void Function()? onPressed,
}) {
  return BottomNavigationBarItem(
    icon: NeumorphicButton(
      padding: EdgeInsets.all(8),
      style: CommonUI.customNeuMorphismStyle(),
      onPressed: onPressed,
      child: Icon(icon),
    ),
    label: '',
  );
}

///  A function that build neumorphic button with icon
Widget circleButton({
  required IconData icon,
  void Function()? onPressed,
  EdgeInsets? margin = EdgeInsets.zero,
  double iconSize = 20,
  double iconLeftPadding = 0,
  Color iconColor = AppColors.black,
}) {
  return NeumorphicButton(
    margin: margin,
    padding: EdgeInsets.all(8),
    style: CommonUI.customNeuMorphismStyle(
      boxShape: NeumorphicBoxShape.circle(),
    ),
    onPressed: onPressed,
    child: Padding(
      padding: EdgeInsets.only(left: iconLeftPadding),
      child: Icon(icon, size: iconSize, color: iconColor),
    ),
  );
}
