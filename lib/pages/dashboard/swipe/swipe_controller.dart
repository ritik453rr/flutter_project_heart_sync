import 'dart:async';

import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:heart_sync/model/user_data_model.dart';

/// A controller for the swipe view.
class SwipeController extends GetxController {
  CardSwiperController swiperController = CardSwiperController();
  var users = <UserDataModel>[].obs;
  RxBool isLoading = true.obs;



  @override
  void onInit() {
    super.onInit();

   // loadUsers();
  }

  /// Loads users from Firestore
  // Future<void> loadUsers() async {
  //   try {
  //     isLoading.value = true;
  //     users.value = FireStoreServices.allUsers;
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to load users: $e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
