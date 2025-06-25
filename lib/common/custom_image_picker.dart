import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:heart_sync/common/app_colors.dart';
import 'package:heart_sync/bottom_sheets/show_image_options.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:share_plus/share_plus.dart';

/// CustomImagePicker class is used to pick images from the gallery or camera
class CustomImagePicker extends StatelessWidget {
  final RxList<File?> selectedImages;
  final Function(int, XFile) onImageSelected;
  final IconData? icon;

  const CustomImagePicker({
    super.key,
    required this.selectedImages,
    required this.onImageSelected,
    this.icon = Icons.edit,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics:const  NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return Obx(() {
          final imageFile = selectedImages[index];
          return GestureDetector(
            onTap: () {
              showImagePickerBottomSheet(
                context: context,
                onImageSelected:
                    (pickedImage) => onImageSelected(index, pickedImage),
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Neumorphic(
                  padding: const EdgeInsets.all(0.9),
                  style: CommonUI.customNeuMorphismStyle(
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                  ),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    color: AppColors.gray,
                    padding: EdgeInsets.zero,
                    borderPadding: EdgeInsets.zero,
                    stackFit: StackFit.expand,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:
                          imageFile != null
                              ? Image.file(imageFile, fit: BoxFit.fill)
                              : Container(color: AppColors.colorPrimary),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  width: 25,
                  height: (imageFile == null) ? 25 : 30,
                  child:
                      (imageFile == null)
                          ? const Icon(
                            Icons.add_circle,
                            color: Colors.pinkAccent,
                            size: 35,
                          )
                          : CircleAvatar(
                            backgroundColor: AppColors.colorPrimary,
                            child: Center(
                              child: Icon(
                                icon,
                                color: AppColors.white,
                                size: 18,
                              ),
                            ),
                          ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
