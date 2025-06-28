import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/common/app_font_sizes.dart';
import 'package:heart_sync/common/app_fonts.dart';
import 'package:heart_sync/common/common_ui.dart';

/// A custom button widget that can be used throughout the app.
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final double width;
  final double height;
  final double horizontalMargin;
  final double borderRadius;
  final bool showImage;
  final String imagePath;
  final bool isLoading;
  final bool isButtonEnabled;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.white,
    this.borderColor = Colors.transparent,
    this.textColor = AppColors.black,
    this.fontSize = AppFontSizes.font16,
    this.width = double.infinity,
    this.height = 48.0,
    this.borderRadius = 40.0,
    this.horizontalMargin = 0,
    this.showImage = false,
    this.imagePath = "",
    this.isLoading = false,
    this.isButtonEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: NeumorphicButton(
        onPressed: isButtonEnabled ? onPressed : null,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        provideHapticFeedback: true,
        style: CommonUI.customNeuMorphismStyle(
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(borderRadius),
          ),
        ),
        child:
            isLoading
                ? const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.black,
                      strokeWidth: 2,
                    ),
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showImage) CommonUI.setSvg(imagePath),
                    if (showImage) const SizedBox(width: 10),
                    Text(
                      text,
                      style: CommonUI.customTextStyle(
                        color: textColor,
                        fontSize: fontSize,
                        fontFamily: AppFonts.fontSemiBold,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
