import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:heart_sync/services/firebase_services.dart';

/// A controller class for managing reauthentication in the application.
class ReauthenticationController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

/// Delete account after reauthentication
  void onTapDelete() {
    FirebaseServices.reauthenticateDeleteAc(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }
}
