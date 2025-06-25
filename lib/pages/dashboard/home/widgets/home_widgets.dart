import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/pages/dashboard/home/home_controller.dart';
import '../../../../common/app_colors.dart';

/// A Function to build pagination loader.
Widget paginationLoader() {
  return Container(
    height: 70,
    width: 70,
    margin: EdgeInsets.only(bottom: 20),
    alignment: Alignment.center,
    child: CircularProgressIndicator(color: AppColors.pink, strokeWidth: 2),
  );
}

Widget homeEmptyState(HomeController controller) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon or Ill
          NeumorphicIcon(
            Icons.people_outline,
            size: 80,
            style: CommonUI.customNeuMorphismStyle(
              color: AppColors.pink.withOpacity(0.5),
              shadowDarkColor: Colors.black12,
              shadowLightColor: Colors.transparent,
            ),
          ),

          CommonUI.neumorphicText(
            'No users found nearby',
            color: AppColors.pink.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
          // refresh button with neumorphic style
          NeumorphicButton(
            onPressed: () => controller.onRefresh(),
            style: CommonUI.customNeuMorphismStyle(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonUI.neumorphicText(
                  "Refresh",
                  fontSize: AppFontSizes.font16,
                  fontFamily: AppFonts.fontMedium,
                ),
                NeumorphicIcon(
                  Icons.refresh,
                  size: 20,
                  style: CommonUI.customNeuMorphismStyle(
                    color: AppColors.black,
                    shadowDarkColor: Colors.black12,
                    //color: AppColors.colorPink.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
