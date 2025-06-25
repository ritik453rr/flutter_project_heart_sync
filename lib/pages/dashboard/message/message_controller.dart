import 'package:get/get.dart';
import 'package:heart_sync/model/friend_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';



/// A controller that manages the state of the message list and search_user functionality.
class MessageController extends GetxController {
  var allFriends = <FriendModel>[].obs;
  var isLoading = true.obs;
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void onInit() {
    super.onInit();
   // fetchFriends();
  }

  /// Method to refresh the friends list
  void onRefresh() async {
   // await fetchFriends();
    refreshController.refreshCompleted();
  }

 

  /// Fetches friends from the Firestore `friends` collection.
  // Future<void> fetchFriends() async {
  //   try {
  //     final userId = AppStorage().getFirebaseUUiD();
  //     final snapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .collection('friends')
  //         .get();
  //     allFriends.assignAll(
  //       snapshot.docs.map((doc) => FriendModel.fromJson(doc.data())).toList(),
  //     );
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to fetch friends: $e');
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// Method to handle the tap event on a friend.
  // void onTapFriend(FriendModel friend) async {
  //   final chatId =
  //       await FireStoreServices.createChat(otherUserId: friend.friendId);
  //   if (chatId.isNotEmpty) {
  //     Get.toNamed(
  //       AppRoutes.routeChat,
  //       arguments: {'chatId': chatId, 'otherUserId': friend.friendId},
  //     );
  //   } else {
  //     Get.snackbar('Error', 'Failed to create chat');
  //   }
  // }
}
