import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:shimmer/shimmer.dart';
import 'app_colors.dart';
import 'app_font_sizes.dart';

/// Common UI utilities
class CommonUI {
  /// Set PNG image
  static Image setPng(String name, {double? height, double? width}) {
    return Image.asset(
      'assets/images/pngs/$name.png',
      height: height,
      width: width,
    );
  }

  /// Set SVG image
  static SvgPicture setSvg(String name,{double? height,Color? color}) {
    return SvgPicture.asset('assets/images/svgs/$name.svg',height: height,
    color: color,
    
    );
  }

  /// Custom text style
  static TextStyle customTextStyle({
    double fontSize = AppFontSizes.font14,
    Color color = AppColors.black,
    String fontFamily = AppFonts.fontRegular,
  }) {
    return TextStyle(fontSize: fontSize, color: color, fontFamily: fontFamily);
  }

  /// A method to return a box decoration.
  static BoxDecoration borderDecoration({
    Color color = AppColors.white,
    double topLeft = 20,
    double topRight = 20,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  /// method to show toast message.
  static Future toast({required String toastMsg}) {
    return Fluttertoast.showToast(
      msg: toastMsg.toString(),
      backgroundColor: Colors.black,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColors.white,
      fontSize: AppFontSizes.font16,
    );
  }

  /// A method to show an adaptive dialog with a title and content.
  static Future adaptiveDialog({
    String title = "Error",
    required String content,
  }) {
    return showAdaptiveDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            title,
            style: customTextStyle(fontSize: 24, color: AppColors.black),
          ),
          content: Text(
            content,
            style: customTextStyle(
              fontSize: AppFontSizes.font14,
              color: AppColors.black,
              fontFamily: AppFonts.fontMedium,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                AppStrings.textOk.tr,
                style: customTextStyle(
                  color: AppColors.primary,
                  fontFamily: AppFonts.fontSemiBold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Custom Neumorphic Style for the app.
  static customNeuMorphismStyle({
    Color color = AppColors.white,
    double depth = 5,
    NeumorphicBoxShape? boxShape,
    Color shadowLightColor = AppColors.white,
    Color shadowDarkColor = Colors.black54,
    Color borderColor = Colors.transparent,
    NeumorphicShape shape = NeumorphicShape.concave,
    double surfaceIntensity = 0.3,
    double borderWidth = 1,
    double intensity = 1,
  }) {
    return NeumorphicStyle(
      depth: depth,
      color: color,
      boxShape: boxShape,
      shadowLightColor: shadowLightColor,
      shadowDarkColor: shadowDarkColor,
      surfaceIntensity: surfaceIntensity,
      shape: shape,
      border: NeumorphicBorder(color: borderColor, width: borderWidth),
      intensity: intensity,
    );
  }

  /// A function to return a neumorphic text widget.
  static Widget neumorphicText(
    String text, {
    double fontSize = AppFontSizes.font18,
    Color color = AppColors.black,
    String fontFamily = AppFonts.fontSemiBold,
    TextAlign textAlign = TextAlign.center,
  }) {
    return NeumorphicText(
      text,
      textAlign: textAlign,
      style: CommonUI.customNeuMorphismStyle(
        color: color,
        shadowDarkColor: Colors.black38,
        shadowLightColor: Colors.transparent,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }

  /// Neumorphic Text style for the app.
  static numorPhicTextStyle({
    double fontSize = AppFontSizes.font10,
    String fontFamily = AppFonts.fontMedium,
  }) {
    return NeumorphicTextStyle(fontSize: fontSize, fontFamily: fontFamily);
  }

  static
  /// A function that returns a widget with a story image.
  Widget
  profileImg({
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

  /// A function that returns a widget with a cached network image.
  static Widget mateImg({
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
                              baseColor: AppColors.shimmerBase,
                              highlightColor: AppColors.shimmerHl,
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
                            " ${"$distance ${AppStrings.textKmAway.tr}"}",
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

  /// A function to show a snackbar with a title and message.
  static snackbar({String? title, required String message}) {
    return Get.snackbar(
      title ?? AppStrings.textError.tr,
      message,
      margin: const EdgeInsets.all(10),
    );
  }
}
