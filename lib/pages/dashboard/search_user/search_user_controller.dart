import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/model/user_data_model.dart';


/// SearchUserController manages the search functionality and user interactions
class SearchUserController extends GetxController {
  final searchQuery = ''.obs;
  final isLoading = false.obs;
  final isSearching = false.obs;
  final userList = <UserDataModel>[].obs;
  final filteredUsers = <UserDataModel>[].obs;
  //final fireStore = FirebaseFirestore.instance;

  // Debouncer for search optimization
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    // fetchFriends();
    // // Listen to search query changes with debounce
    // ever(searchQuery, (_) {
    //   if (_debounce?.isActive ?? false) _debounce!.cancel();
    //   _debounce = Timer(const Duration(milliseconds: 500), () {
    //     _filterUsers();
    //   });
    // });
  }

  // @override
  // void onClose() {
  //   _debounce?.cancel();
  //   super.onClose();
  // }

  // void _filterUsers() {
  //   if (searchQuery.value.isEmpty) {
  //     filteredUsers.value = userList;
  //     return;
  //   }

  //   final query = searchQuery.value.toLowerCase().trim();
  //   filteredUsers.value = userList
  //       .where((user) => user.name.toLowerCase().contains(query))
  //       .toList();
  // }

  // Future<void> fetchFriends() async {
  //   try {
  //     isLoading.value = true;
  //     final currentUserId = AppStorage().getFirebaseUUiD();

  //     debugPrint('Fetching friends for user: $currentUserId');

  //     // Get the friends collection
  //     final friendsSnapshot = await fireStore
  //         .collection('users')
  //         .doc(currentUserId)
  //         .collection('friends')
  //         .get();

  //     debugPrint('Found ${friendsSnapshot.docs.length} friends');

  //     if (friendsSnapshot.docs.isEmpty) {
  //       userList.clear();
  //       filteredUsers.clear();
  //       return;
  //     }

  //     // Get all friend IDs
  //     final friendIds = friendsSnapshot.docs.map((doc) => doc.id).toList();
  //     debugPrint('Friend IDs: $friendIds');

  //     // Fetch all friend user documents in a single batch
  //     final usersSnapshot = await fireStore
  //         .collection('users')
  //         .where(FieldPath.documentId, whereIn: friendIds)
  //         .get();

  //     debugPrint('Fetched ${usersSnapshot.docs.length} user documents');

  //     // Convert to UserDataModel objects
  //     final friends = usersSnapshot.docs
  //         .map((doc) => UserDataModel.fromJson(doc.data()))
  //         .toList();

  //     // Sort by name
  //     friends.sort((a, b) => a.name.compareTo(b.name));

  //     userList.value = friends;
  //     filteredUsers.value = friends;

  //     debugPrint('Processed ${friends.length} friends');
  //   } catch (e) {
  //     debugPrint('Error fetching friends: $e');
  //     Get.snackbar(
  //       'Error',
  //       'Failed to load friends: $e',
  //       duration: const Duration(seconds: 3),
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Future<void> refreshFriends() async {
  //   searchQuery.value = '';
  //   await fetchFriends();
  // }

  // void onUserTap(UserDataModel user) async {
  //   try {
  //     final chatId = await FireStoreServices.createChat(otherUserId: user.uid);
  //     if (chatId.isNotEmpty) {
  //       Get.toNamed(
  //         AppRoutes.routeChat,
  //         arguments: {'chatId': chatId, 'otherUserId': user.uid},
  //       );
  //     }
  //   } catch (e) {
  //     debugPrint('Error creating chat: $e');
  //     Get.snackbar('Error', 'Failed to create chat');
  //   }
  // }

  // void clearSearch() {
  //   searchQuery.value = '';
  // }
}
