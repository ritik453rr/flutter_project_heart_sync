import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';

/// A Controller class for the Forgot Password screen.
class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  /// Function to validate the Email using Regx
  bool validateEmail() {
    var email = emailController.text.trim();
    if (email.isEmpty) {
      CommonUI.adaptiveDialog(content: AppStrings.textEnterEmail.tr);
      return false;
    } else if (!GetUtils.isEmail(email)) {
      CommonUI.adaptiveDialog(content: AppStrings.textEnterValidEmail.tr);
      return false;
    }
    return true;
  }

  /// Function to send the password reset email
  void sendPasswordResetEmail() async {
    if (!await AppConstants.checkInternetConnection()) {
      CommonUI.toast(toastMsg: AppStrings.textNoInternetConnection.tr);
      return;
    }
    if (validateEmail()) {
      try {
        var email = emailController.text.trim();
        AppConstants.hideKeyboard();
        isLoading.value = true;
        await auth.sendPasswordResetEmail(email: email);
        emailController.clear();
        // Get.back();
        CommonUI.snackbar(
          title: "Email Sent",
          message: "Password reset email sent to $email",
        );
        
      } catch (e) {
        debugPrint("Error sending password reset email: $e");
        CommonUI.snackbar(message: "Failed to send email: ");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
