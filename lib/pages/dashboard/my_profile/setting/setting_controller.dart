import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heart_sync/common/app_storage.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/routing/app_routes.dart';

/// A controller class for managing settings in the application.
class SettingController extends GetxController {
  /// Instances
  var auth = FirebaseAuth.instance;
  var currentLocation = "Loading...".obs;
  //AppStorage appStorage = AppStorage();

  @override
  void onInit() {
    super.onInit();
    //fetchCurrentLocation();
  }

  /// method to logout the user from the application
  void logout() async {
    AppStorage.setLoginStatus(false);
    await auth.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(AppRoutes.login);
  }

  void deleteAccount() async {
    try {
      // Delete the user's account
      await auth.currentUser?.delete();
      // Clear login status
      AppStorage.setLoginStatus(false);
      // Sign out from Google
      await GoogleSignIn().signOut();
      // Navigate to login screen
      Get.offAllNamed(AppRoutes.login);
    } on FirebaseAuthException catch (e) {
       if (e.code == 'requires-recent-login') {
      print("The user must re-authenticate before deleting the account.");
      // Trigger reauthentication here .....
//       Future<void> reauthenticateUser(String email, String password) async {
//   try {
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       // Create auth credentials
//       AuthCredential credential = EmailAuthProvider.credential(
//         email: email,
//         password: password,
//       );

//       // Reauthenticate
//       await user.reauthenticateWithCredential(credential);

//       print("Reauthentication successful!");
//     } else {
//       print("No user is currently signed in.");
//     }
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'wrong-password') {
//       print("Wrong password provided.");
//     } else if (e.code == 'user-mismatch') {
//       print("Credential does not match the current user.");
//     } else {
//       print("Reauthentication error: ${e.message}");
//     }
//   }
// }
      
        
    } else {
      print("Error: ${e.message}");
    }
    }
  }

  /// Function to logout the user
  // void logout() {

  // }

  /// Function to fetch the current location of the user and convert it into a readable address.
  // void fetchCurrentLocation() async {
  //   Position? position = await Global.getCurrentLocation();
  //   if (position != null) {
  //     try {
  //       List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  //       if (placemarks.isNotEmpty) {
  //         Placemark place = placemarks.first;
  //         currentLocation.value =
  //         "${place.name}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
  //       } else {
  //         currentLocation.value = "Address not found";
  //       }
  //     } catch (e) {
  //       currentLocation.value = "Error getting address";
  //       debugPrint("Geocoding error: $e");
  //     }
  //   } else {
  //     currentLocation.value = "Location not available";
  //   }
  // }
}
