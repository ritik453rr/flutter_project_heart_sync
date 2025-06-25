import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../model/user_data_model.dart';

/// A controller to manage the home view.
class HomeController extends GetxController {
  // Controllers
  final scrollController = ScrollController();
  final pageController = PageController();
  final refreshController = RefreshController(initialRefresh: false);

  // Firebase
  //final fireStore = FirebaseFirestore.instance;

  // State variables
  bool hasMore = false;
 // DocumentSnapshot? lastDocument;
  final userList = <UserDataModel>[].obs;
  final Set<String> loadedUserIds = {};
  var isFetchingMore = false.obs;
  var isLoading = false.obs;
  var pageSize = 5;

  // Cache current user ID and friends list
  String? currentUserId;
  final Set<String> _friendIds = {};

  @override
  void onInit() {
    super.onInit();

   // currentUserId = AppStorage().getFirebaseUUiD();
    //FireStoreServices.fetchAllUsers();
    //_loadFriends();
    addListenersToMatchsController();
    addListToNearYouController();
  }

  /// Add listeners to the scroll controller and page controller
  void addListenersToMatchsController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 150 &&
          hasMore) {
       // fetchMoreData();
      }
    });
  }

  /// Add listeners to the scroll controller and page controller
  void addListToNearYouController() {
    pageController.addListener(() {
      if (pageController.position.pixels >=
              pageController.position.maxScrollExtent - 150 &&
          hasMore) {
        //fetchMoreData();
      }
    });
  }

  Future<void> onRefresh() async {
    //await fetchInitialData();
    refreshController.refreshCompleted();
    //FireStoreServices.fetchAllUsers();
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
    if (pageController.hasClients) {
      pageController.jumpTo(0);
    }
  }

  /// Load friends from Firestore
  // Future<void> _loadFriends() async {
  //   try {
  //     final messageController = Get.find<MessageController>();
  //     await messageController.fetchFriends();

  //     // Extract friend IDs from the allFriends observable list
  //     _friendIds.clear();
  //     for (var friend in messageController.allFriends) {
  //       _friendIds.add(friend.friendId);
  //     }

  //     // Now fetch initial data after friends are loaded
  //     await fetchInitialData();
  //   } catch (e) {
  //     debugPrint("Error loading friends: $e");
  //     // Still try to fetch initial data even if friends loading fails
  //     await fetchInitialData();
  //   }
  // }

  /// Method to fetch initial users
  // Future<void> fetchInitialData() async {
  //   try {
  //     final currentUserId = AppStorage().getFirebaseUUiD();

  //     // Get all friend IDs to exclude (both friends and added_friends)
  //     final friendsSnapshot = await fireStore
  //         .collection('users')
  //         .doc(currentUserId)
  //         .collection('friends')
  //         .get();

  //     // final addedFriendsSnapshot = await fireStore
  //     //     .collection('users')
  //     //     .doc(currentUserId)
  //     //     .collection('added_friends')
  //     //     .get();

  //     final excludeIds = <String>{};
  //     excludeIds.add(currentUserId); // Add current user to exclusion list

  //     // Add friends to exclusion list
  //     for (var doc in friendsSnapshot.docs) {
  //       excludeIds.add(doc.id);
  //     }

  //     // // Add added_friends to exclusion list
  //     // for (var doc in addedFriendsSnapshot.docs) {
  //     //   excludeIds.add(doc.id);
  //     // }

  //     // If we have IDs to exclude, use whereNotIn
  //     if (excludeIds.isNotEmpty) {
  //       final query = fireStore
  //           .collection('users')
  //           .where(FieldPath.documentId, whereNotIn: excludeIds.toList())
  //           .orderBy('name')
  //           .limit(pageSize);

  //       final querySnapshot = await query.get();
  //       hasMore = querySnapshot.docs.length == pageSize;

  //       if (querySnapshot.docs.isNotEmpty) {
  //         lastDocument = querySnapshot.docs.last;
  //         final users = querySnapshot.docs
  //             .map((doc) => UserDataModel.fromJson(doc.data()))
  //             .toList();
  //         userList.assignAll(users);
  //       } else {
  //         userList.clear();
  //       }
  //     } else {
  //       userList.clear();
  //       hasMore = false;
  //     }

  //     isLoading(false);
  //   } catch (e) {
  //     debugPrint("Error fetching initial data: $e");
  //     isLoading(false);
  //   }
  // }

  /// Method to fetch more users
  // Future<void> fetchMoreData() async {
  //   // Early return if already fetching or no more data
  //   if (isFetchingMore.value || !hasMore || lastDocument == null) {
  //     return;
  //   }

  //   try {
  //     isFetchingMore.value = true;

  //     // Create query once
  //     final query = fireStore
  //         .collection('users')
  //         .orderBy('name')
  //         .limit(pageSize)
  //         .startAfterDocument(lastDocument!);

  //     final querySnapshot = await query.get();

  //     // Update pagination state
  //     hasMore = querySnapshot.docs.length == pageSize;

  //     if (querySnapshot.docs.isNotEmpty) {
  //       // Set last document for pagination
  //       lastDocument = querySnapshot.docs.last;

  //       // Process and filter users in a single pass
  //       final newUsers = querySnapshot.docs
  //           .map((doc) => UserDataModel.fromJson(doc.data()))
  //           .where((user) =>
  //               user.uid != currentUserId && !_friendIds.contains(user.uid))
  //           .toList();

  //       // Update UI
  //       userList.addAll(newUsers);
  //     } else {}
  //   } catch (e) {
  //     debugPrint("Error fetching more data: $e");
  //   } finally {
  //     isFetchingMore.value = false;
  //   }
  // }

  /// Method to refresh the data
}
