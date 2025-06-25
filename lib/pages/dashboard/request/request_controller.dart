import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../model/request_model.dart';

/// A controller for managing requests in the application.
class RequestController extends GetxController {
  var requests = <RequestModel>[].obs;
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  @override
  onInit() {
    super.onInit();
   // loadRequests();
  }

  /// method to refresh the comment list.
  void onRefresh() async {
    //await loadRequests();
    refreshController.refreshCompleted();
  }

  /// method to load more comments.
  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

  /// Fetch requests for the current user
  // Future<void> loadRequests() async {
  //   requests.value = await FireStoreServices.loadRequests() ?? [];
  // }

  /// Delete a request by its ID
  // void deleteRequest({required String requestId}) async {
  //   var result = await FireStoreServices.deleteRequest(requestId: requestId);
  //   if (result) {
  //     requests.removeWhere((request) => request.requestId == requestId);
  //   } else {
  //     Get.snackbar('Error', 'Failed to delete request');
  //   }
  // }

  /// Accept a friend request
  // void onTapAccept({required RequestModel request}) async {
  //   var result = await FireStoreServices.acceptRequest(request: request);
  //   if (result) {
  //     deleteRequest(requestId: request.requestId);
  //     Get.snackbar('Success', 'Friend request accepted');
  //   } else {
  //     Get.snackbar('Error', 'Failed to accept request');
  //   }
  // }
}
