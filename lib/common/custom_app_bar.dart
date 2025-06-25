import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import '../pages/dashboard/dashboard_main/widgets_dashboard.dart';
import 'app_fonts.dart';
import 'common_ui.dart';

/// A custom app bar widget.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final Color backgroundColor;
  final String title;
  final Color titleColor;
  final bool centerTitle;
  final IconData? trailingIcon;
  final double titleFontSize;
  final void Function()? onTapTrailingIcon;
  final bool shadow;
  final bool hideBackButton;

  const CustomAppBar({
    super.key,
    this.appBarHeight = 56,
    this.backgroundColor = AppColors.background,
    this.title = '',
    this.centerTitle = true,
    this.trailingIcon,
    this.titleFontSize = AppFontSizes.font20,
    this.onTapTrailingIcon,
    this.shadow = true,
    this.hideBackButton = false,
    this.titleColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          shadow
              ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              )
              : null,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        centerTitle: centerTitle,
        leading:
            hideBackButton
                ? null
                : circleButton(
                  icon: Icons.arrow_back_ios,
                  onPressed: () => Get.back(),
                  margin: const EdgeInsets.only(left: 20),
                  iconLeftPadding: 3,
                ),
        title:
            title.isEmpty
                ? null
                : NeumorphicText(
                  title,
                  style: CommonUI.customNeuMorphismStyle(
                    color: titleColor,
                    shadowDarkColor: Colors.black26,
                  ),
                  textStyle: CommonUI.numorPhicTextStyle(
                    fontSize: titleFontSize,
                    fontFamily: AppFonts.fontSemiBold,
                  ),
                ),
        actions: [
          trailingIcon == null
              ? const SizedBox()
              : circleButton(
                icon: trailingIcon!,
                onPressed: onTapTrailingIcon,
                margin: const EdgeInsets.only(right: 20),
              ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
