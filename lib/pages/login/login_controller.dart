import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';

/// A controller class that manages the login screen functionality.
class LoginController extends GetxController {
  /// Instances and controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Instance of GoogleSignIn for handling Google authentication
  //final GoogleSignIn _googleSignIn = GoogleSignIn();

  // AppStorage appStorage = AppStorage();

 /// Variables
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  /// Toggles the visibility of the password field.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Validates the email format using a regular expression.
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

  /// Validates the password length and presence.
  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return '';
  }

  /// Authenticates the user using email and password.
  void loginUser(String email, String password) {}

  /// Initiates the login process with email and password.
  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    String emailError = validateEmail(email);
    String passwordError = validatePassword(password);

    if (emailError.isNotEmpty) {
      Get.snackbar('Error', emailError, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (passwordError.isNotEmpty) {
      Get.snackbar('Error', passwordError, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    loginUser(email, password);
  }

  /// Handles Google Sign-In authentication.
  Future<void> signInWithGoogle() async {
    {
      if (!await AppConstants.checkInternetConnection()) {
        Get.snackbar(
          'Error',
          'No internet connection',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
    }
  }
}
