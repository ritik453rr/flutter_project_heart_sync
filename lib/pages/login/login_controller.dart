import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_storage.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/routing/app_routes.dart';
import 'package:heart_sync/services/firebase_services.dart';

/// A controller class that manages the login screen functionality.
class LoginController extends GetxController {
  /// Instances and controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  /// Variables
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  /// Toggles the visibility of the password field.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool validateAllFields() {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
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
    }

    return true;
  }

  /// Initiates the login process with email and password.
  void login() async {
    if (!await AppConstants.checkInternetConnection()) {
      CommonUI.toast(toastMsg: AppStrings.textNoInternetConnection.tr);
      return;
    }
    if (validateAllFields()) {
      try {
        String email = emailController.text;
        String password = passwordController.text.trim();
        isLoading.value = true;
        await auth.signInWithEmailAndPassword(email: email, password: password);
        AppStorage.setLoginStatus(true);
        Get.offAllNamed(AppRoutes.dashboard);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          CommonUI.adaptiveDialog(content: AppStrings.textNoUsersFound.tr);
        } else if (e.code == 'wrong-password') {
          CommonUI.adaptiveDialog(content: AppStrings.textWrongPassword.tr);
        } else {
          debugPrint('Error: ${e.message}');
          CommonUI.adaptiveDialog(
            content: AppStrings.textInvalidCredentials.tr,
          );
        }
      } catch (e) {
        CommonUI.adaptiveDialog(
          content: '${AppStrings.textUnExpectedError.tr}: $e',
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  /// Initiates the Google sign-in process.
  void loginWithGoogle() async {
    if (!await AppConstants.checkInternetConnection()) {
      CommonUI.toast(toastMsg: AppStrings.textNoInternetConnection.tr);
      return;
    }
    if (await FirebaseServices.signInWithGoogle()) {
      AppStorage.setLoginStatus(true);
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      CommonUI.snackbar(message: AppStrings.textSignInFailed.tr);
    }
  }
}
