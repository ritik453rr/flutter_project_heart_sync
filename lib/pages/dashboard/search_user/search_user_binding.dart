import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/search_user/search_user_controller.dart';

/// A binding class that manages the dependencies for the SearchView.
class SearchUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchUserController());
  }
}