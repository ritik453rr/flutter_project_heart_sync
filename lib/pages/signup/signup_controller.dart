import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/common_ui.dart';
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
  var snackbarShown = false;

  /// Toggles the visibility of the password.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Toggles the visibility of the confirm password.
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

/// Validates the input fields for email, password, and confirm password.
  bool validate() {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    var confirmPassword = confirmPasswordController.text.trim();
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
      if (snackbarShown) return false; // Prevent multiple snackbars
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
    } else if (password.length < 8) {
      if (snackbarShown) return false; // Prevent multiple snackbars
      snackbarShown = true;
      Future.delayed(const Duration(seconds: 3), () {
        snackbarShown = false;
      });
      CommonUI.snackbar("Error", " Password length must be 8 character");
      return false;
    }

    // Validate confirm password
    if (confirmPassword.isEmpty) {
      if (snackbarShown) return false; // Prevent multiple snackbars
      snackbarShown = true;
      Future.delayed(const Duration(seconds: 3), () {
        snackbarShown = false;
      });
      CommonUI.snackbar("Error", 'Please confirm your password');
      return false;
    } else if (confirmPassword != passwordController.text) {
      if (snackbarShown) return false; // Prevent multiple snackbars
      snackbarShown = true;
      Future.delayed(const Duration(seconds: 3), () {
        snackbarShown = false;
      });
      CommonUI.snackbar("Error", 'Passwords do not match');
      return false;
    }

    return true;
  }

  /// Function to create the user using Email and Password
  Future<void> createUser() async {
    if (validate()) {
      if (isLoading.value) return; // Prevent multiple submissions
      isLoading.value = true; // Set loading state to true
      try {
        var credential = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        CommonUI.snackbar('Success', 'User created successfully');
        Get.toNamed(AppRoutes.login);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          if (snackbarShown) return; // Prevent multiple snackbars
          snackbarShown = true;
          Future.delayed(const Duration(seconds: 3), () {
            snackbarShown = false;
          });
          CommonUI.snackbar('Error', 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          if (snackbarShown) return; // Prevent multiple snackbars
          snackbarShown = true;
          Future.delayed(const Duration(seconds: 3), () {
            snackbarShown = false;
          });
          CommonUI.snackbar('Error', 'The account already exists for that email.');
        }
      } catch (e) {
        CommonUI.snackbar('Error', 'An unexpected error occurred');
      } finally {
        isLoading.value = false; // Reset loading state
      }
    }
  }

}
