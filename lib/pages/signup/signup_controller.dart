import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/routing/app_routes.dart';

/// A Controller class for the SignUp screen.
class SignUpController extends GetxController {
  /// Controllers ans instances
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Variables
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;

  /// Toggles the visibility of the password.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Toggles the visibility of the confirm password.
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  /// Validates the input fields for email, password, and confirm password.
  bool validateAllFields() {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    var confirmPassword = confirmPasswordController.text.trim();
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z]+(\.[a-zA-Z]+)+$';
    RegExp regExp = RegExp(emailPattern);
    // Validate email
    if (email.isEmpty) {
      CommonUI.adaptiveDialog(content: AppStrings.textEnterEmail.tr);
      return false;
    } else if (!regExp.hasMatch(email)) {
      CommonUI.adaptiveDialog(content: AppStrings.textEnterValidEmail.tr);
      return false;
    }

    // Validate password
    if (password.isEmpty) {
      CommonUI.adaptiveDialog(content: AppStrings.textEnterPassword.tr);
      return false;
    } else if (password.length < 8) {
      CommonUI.adaptiveDialog(
        content: AppStrings.textPasswordLengthConstraint.tr,
      );
      return false;
    }

    // Validate confirm password
    if (confirmPassword.isEmpty) {
      CommonUI.adaptiveDialog(content: AppStrings.textConfirmPassword.tr);
      return false;
    } else if (confirmPassword != passwordController.text) {
      CommonUI.adaptiveDialog(content: AppStrings.textPasswordsDoNotMatch.tr);
      return false;
    }

    return true;
  }

  /// Function to create the user using Email and Password
  Future<void> signUp() async {
    AppConstants.hideKeyboard();
    if (!await AppConstants.checkInternetConnection()) {
      CommonUI.toast(toastMsg: AppStrings.textNoInternetConnection.tr);
      return;
    }
    if (validateAllFields()) {
      if (isLoading.value) return;
      isLoading.value = true;

      try {
        await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        CommonUI.snackbar(
          title: AppStrings.textSuccess.tr,
          message: AppStrings.textUserCreatedSuccessfully.tr,
        );
        Get.toNamed(AppRoutes.login);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          CommonUI.snackbar(message: AppStrings.textPasswordIsTooWeak.tr);
        } else if (e.code == 'email-already-in-use') {
          CommonUI.adaptiveDialog(content: AppStrings.textEmailAlreadyInUse.tr);
        }
      } catch (e) {
        debugPrint('Error creating user: $e');
        CommonUI.snackbar(message: AppStrings.textUnExpectedError.tr);
      } finally {
        isLoading.value = false;
      }
    }
  }
}
