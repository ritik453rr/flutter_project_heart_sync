import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heart_sync/common/app_storage.dart';
import 'package:heart_sync/common/common_ui.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/reauthentication/reauthentication_view.dart';
import 'package:heart_sync/routing/app_routes.dart';
import 'package:heart_sync/services/firebase_services.dart';

/// A controller class for managing settings in the application.
class SettingController extends GetxController {
  /// Instances
  var auth = FirebaseAuth.instance;
  var currentLocation = "Loading...".obs;
  var acDeleting = false.obs;
  var logoutLoading = false.obs;
  //AppStorage appStorage = AppStorage();

  @override
  void onInit() {
    super.onInit();
    //fetchCurrentLocation();
  }

  /// handle ac deletion confirmation
  void onConfirmDelete() async {
    Get.back();
    acDeleting.value = true;
    await FirebaseServices.deleteAccount();
     FirebaseServices.logout();
    acDeleting.value = false;
    Get.offAllNamed(AppRoutes.login);
  }
  
  /// Handle logout confirmation
  void onConfirmLogout() async {
    Get.back();
    logoutLoading.value = true;
    await FirebaseServices.logout();
    logoutLoading.value = false;
    Get.offAllNamed(AppRoutes.login);
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
