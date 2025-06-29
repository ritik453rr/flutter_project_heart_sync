import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/language/app_strings.dart';
import 'package:heart_sync/model/user_data_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';

/// A controller for the DetailPage.
class DetailPageController extends GetxController {
  // Controllers
  final pageController = PageController();
  final scrollController = ScrollController();
  final refreshController = RefreshController(initialRefresh: false);

  // Observable variables
  //final user = Rxn<UserDataModel>();
  // final age = 0.obs;
  // final selectedReason = "".obs;
  // final isLoading = false.obs;
  // final currentImageIndex = 0.obs;
  // final isRequested = false.obs; // Track if user is added

  // Reasons for reporting
  final List<String> reasons = [
    AppStrings.textSpam.tr,
    AppStrings.textInappropriateContent.tr,
    AppStrings.textHarassment.tr,
    AppStrings.textFakeProfile.tr,
    AppStrings.textScam.tr,
    AppStrings.textOthers.tr,
  ];

  @override
  void onInit() {
    super.onInit();
    // _initializeData();
    // _setupListeners();
    // _checkIfAdded();
  }

  @override
  void onClose() {
    pageController.dispose();
    scrollController.dispose();
    refreshController.dispose();
    super.onClose();
  }

  /// Method to set the selected reason for reporting
  // void setSelectedReason(String reason) {
  //   _selectedReason.value = reason;
  // }

  // method to check if user is already requested
  // void checkRequested() async {
  //   try {
  //     //final currentUserId = AppStorage().getFirebaseUUiD();
  //     //final doc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(currentUserId)
  //         .collection('added_friends')
  //         .doc(user.uid)
  //         .get();

  //     _isRequested.value = doc.exists;
  //   } catch (e) {
  //     debugPrint('Error checking if user is added: $e');
  //   }
  // }
  /// Initialize the data
  // void _initializeData() {
  //   try {
  //     final userData = Get.arguments as UserDataModel;
  //     _user.value = userData;
  //     _age.value = _calculateAge(userData.dob);
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Failed to load user data',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     Get.back();
  //   }
  // }

  /// Setup listeners for controllers
  // void _setupListeners() {
  //   pageController.addListener(() {
  //     if (pageController.page != null) {
  //       _currentImageIndex.value = pageController.page!.round();
  //     }
  //   });
  // }

  /// Calculate age from date string
  int _calculateAge(String dateString) {
    try {
      final parts = dateString.split('/');
      if (parts.length != 3) throw FormatException('Invalid date format');

      final birthDate = DateTime.parse(parts.reversed.join('-'));
      final today = DateTime.now();
      var age = today.year - birthDate.year;

      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      debugPrint('Error calculating age: $e');
      return 0;
    }
  }

  /// Handle refresh
  // Future<void> onRefresh() async {
  //   try {
  //     final userData = Get.arguments as UserDataModel;
  //     _user.value = userData;
  //     _age.value = _calculateAge(userData.dob);
  //     refreshController.refreshCompleted();
  //   } catch (e) {
  //     refreshController.refreshFailed();
  //   }
  // }

  /// Handle loading more
  Future<void> onLoading() async {
    refreshController.loadComplete();
  }

  // /// Handle the on tap of trailing icon in AppBar
  // void onTapTrailingIcon() {
  //   ActionBottomSheet().showBottomSheet(
  //     onTapShare: _shareProfile,
  //     onTapBlock: () {
  //       Get.back();
  //       blockDialog(subTitle: " ${Strings.textBlockTo.tr + user.name}?");
  //     },
  //     onTapReport: () {
  //       Get.back();
  //       onTapReport();
  //     },
  //   );
  // }

  /// Share user profile
  // void _shareProfile() {
  //   Get.back();
  //   Share.share(
  //     'Check out ${user.name}\'s profile on VibeMate!',
  //     subject: 'VibeMate Profile Share',
  //   );
  // }

  /// Show report bottom sheet
  // void onTapReport() {
  //   ReportBottomSheet().showSheet(controller: this).whenComplete(() {
  //     _selectedReason.value = "";
  //   });
  // }

  /// Check if user is already added
  // Future<void> _checkIfAdded() async {
  //   try {
  //     final currentUserId = AppStorage().getFirebaseUUiD();
  //     final doc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(currentUserId)
  //         .collection('added_friends')
  //         .doc(user.uid)
  //         .get();

  //     _isRequested.value = doc.exists;
  //   } catch (e) {
  //     debugPrint('Error checking if user is added: $e');
  //   }
  // }

  /// Handle friend request
  // Future<void> onTapAdd() async {
  //   if (_isLoading.value) return;

  //   try {
  //     _isLoading.value = true;
  //     final fireStore = FirebaseFirestore.instance;
  //     final currentUserId = AppStorage().getFirebaseUUiD();
  //     final requestId = DateTime.now().millisecondsSinceEpoch.toString();

  //     // Create request model
  //     final request = RequestModel(
  //       senderId: currentUserId,
  //       senderName: FireStoreServices.currentUser.name,
  //       requestId: requestId,
  //     );

  //     // Add to requests collection of recipient
  //     await fireStore
  //         .collection('users')
  //         .doc(user.uid)
  //         .collection('requests')
  //         .doc(requestId)
  //         .set(request.toJson());

  //     // Add to added_friends collection of current user
  //     await fireStore
  //         .collection('users')
  //         .doc(currentUserId)
  //         .collection('added_friends')
  //         .doc(user.uid)
  //         .set({
  //       'userId': user.uid,
  //       'name': user.name,
  //       'addedAt': FieldValue.serverTimestamp(),
  //     });

  //     _isRequested.value = true;
  //     await NotificationServices.sendPushNotification(
  //       fcmToken: user.fcmToken,
  //       title: FireStoreServices.currentUser.name,
  //       body: "${ FireStoreServices.currentUser.name} sent you a friend request",
  //     );

  //     // Refresh home view data
  //     final homeController = Get.find<HomeController>();
  //     await homeController.onRefresh();

  //     Get.snackbar(
  //       'Success',
  //       'Friend request sent to ${user.name}!',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Failed to send request. Please try again.',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     debugPrint('Error sending friend request: $e');
  //   } finally {
  //     _isLoading.value = false;
  //   }
  // }

  /// Jump to a specific image
  // void jumpToImage(int index) {
  //   if (index >= 0 && index < user.imageUrls.length) {
  //     pageController.jumpToPage(index);
  //   }
  // }

  /// Animate to next image
  // void nextImage() {
  //   if (currentImageIndex < user.imageUrls.length - 1) {
  //     pageController.nextPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

  /// Animate to previous image
  // void previousImage() {
  //   if (currentImageIndex > 0) {
  //     pageController.previousPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }
}
