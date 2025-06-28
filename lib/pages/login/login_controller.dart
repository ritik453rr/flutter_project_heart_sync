import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/app_storage.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/language/strings.dart';
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
  var snackbarShown = false;

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
      if (snackbarShown) return false; // Prevent multiple snackbars
      snackbarShown = true;
      Future.delayed(const Duration(seconds: 3), () {
        snackbarShown = false;
      });
      CommonUI.snackbar('Error', 'Please enter your email address');
      return false;
    } else if (!regExp.hasMatch(email)) {
      if (snackbarShown) return false;
      snackbarShown = true;
      Future.delayed(const Duration(seconds: 3), () {
        snackbarShown = false;
      });
      CommonUI.snackbar('Error', 'Please enter a valid email address');
      return false;
    }

    // Validate password
    if (password.isEmpty) {
      if (snackbarShown) return false; // Prevent multiple snackbars
      snackbarShown = true;
      Future.delayed(const Duration(seconds: 3), () {
        snackbarShown = false;
      });
      CommonUI.snackbar('Error', 'Please enter your password');
      return false;
    }

    return true;
  }

  /// Initiates the login process with email and password.
  void login() async {
    if (!await AppConstants.checkInternetConnection()) {
      CommonUI.toast(toastMsg: Strings.textNoInternetConnection.tr);
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
          CommonUI.snackbar('Error', 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          CommonUI.snackbar('Error', 'Wrong password.');
        } else {
          debugPrint('Error: ${e.message}');
          CommonUI.snackbar('Error', 'Invalid credentials. Please try again.');
        }
      } catch (e) {
        CommonUI.snackbar('Error', 'An unexpected error occurred: $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  /// Initiates the Google sign-in process.
  void loginWithGoogle() async {
    if (!await AppConstants.checkInternetConnection()) {
      CommonUI.toast(toastMsg: Strings.textNoInternetConnection.tr);
      return;
    }
    if (await FirebaseServices.signInWithGoogle()) {
      AppStorage.setLoginStatus(true);
      Get.offAllNamed(AppRoutes.dashboard);
      
    } else {
      CommonUI.snackbar('Error', 'Google sign-in failed. Please try again.');
    }
  }
}
