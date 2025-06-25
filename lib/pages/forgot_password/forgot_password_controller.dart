import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';

/// A Controller class for the Forgot Password screen.
class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;

  /// Function to validate the Email using Regx
  String validateEmail(String value) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return '';
  }

  /// Function to send the password reset email
  void sendPasswordResetEmail() async {
    String email = emailController.text.trim();
    String validationMessage = validateEmail(email);

    if (validationMessage.isNotEmpty) {
      AppConstants.hideKeyboard();
      Get.snackbar(
        'Error',
        validationMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      if (!await AppConstants.checkInternetConnection()) {
        AppConstants.hideKeyboard();
        Get.snackbar(
          'Error',
          'No internet connection',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
        return;
      }

      isLoading.value = true;
      //await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      AppConstants.hideKeyboard();
      Get.snackbar(
        'Success',
        'Password reset email sent to $email',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );

      await Future.delayed(const Duration(seconds: 3));
      Get.back();
    } catch (e) {
      AppConstants.hideKeyboard();
      Get.snackbar(
        'Error',
        'Failed to send password reset email',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
