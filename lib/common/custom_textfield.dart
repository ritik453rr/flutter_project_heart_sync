import 'package:flutter/services.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'app_colors.dart';
import 'common_ui.dart';

/// A custom text field widget.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.fillColor = AppColors.white,
    this.hintColor = AppColors.black,
    this.borderRadius = 40,
    this.maxLines = 1,
    this.readOnly = false,
    this.obSecureText = false,
    this.showSuffixIcon = false,
    this.textAlign = TextAlign.start,
    this.onTap,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.suffixIcon,
    this.suffixIconTap,
    this.isTextCapital = false,
    this.isTextInputDone = false,

    this.prefixIcon,
    this.showTitle = false,
    this.title = "",
    this.maxLength,
    this.isMaxLength = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Color fillColor;
  final Color hintColor;
  final double borderRadius;
  final bool readOnly;
  final bool? obSecureText;
  final bool? showSuffixIcon;
  final TextAlign textAlign;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final void Function()? suffixIconTap;
  final bool isTextCapital;
  final bool isTextInputDone;
  final int maxLines;
  final bool showTitle;
  final String title;
  final int? maxLength;
  final bool isMaxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle
            ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.hzPadding,
              ),
              child: Text(title, style: CommonUI.customTextStyle()),
            )
            : const SizedBox(),
        showTitle ? const SizedBox(height: 16) : const SizedBox(),
        Neumorphic(

          style: CommonUI.customNeuMorphismStyle(
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(borderRadius),
            ),
          ),

          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            maxLines: maxLines,
            maxLength: isMaxLength ? maxLength : null,
            obscureText: obSecureText!,
            textAlign: textAlign,
            keyboardType: keyboardType,
            cursorColor: AppColors.black,
            inputFormatters: inputFormatters,
            textCapitalization:
                isTextCapital == true
                    ? TextCapitalization.words
                    : TextCapitalization.none,
            focusNode: focusNode,
            onTap: onTap,
            onChanged: onChanged,
            style: CommonUI.customTextStyle(color: AppColors.black),
            validator: validator,
            enableInteractiveSelection: true,
            textInputAction:
                isTextInputDone == true
                    ? TextInputAction.done
                    : TextInputAction.next,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              hintText: hintText,
              counter: const SizedBox.shrink(),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 14,
              ),
              prefixIcon:
                  prefixIcon == null
                      ? null
                      : Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(prefixIcon, color: AppColors.black),
                      ),
              suffixIcon:
                  showSuffixIcon!
                      ? Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: suffixIconTap,
                          child: Icon(suffixIcon!),
                        ),
                      )
                      : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              hintStyle: CommonUI.customTextStyle(color: hintColor),
              fillColor: fillColor,
              filled: true,
              enabledBorder: borderStyle(),
              focusedBorder: borderStyle(),
              errorBorder: borderStyle(),
              focusedErrorBorder: borderStyle(),
            ),
          ),
        ),
      ],
    );
  }

  /// Border style for the text field
  InputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}

/// A custom text input formatter that prevents leading spaces.
class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
