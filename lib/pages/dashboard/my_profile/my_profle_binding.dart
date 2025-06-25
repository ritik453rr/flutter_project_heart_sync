import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/my_profile/my_profile_controller.dart';

/// ProfileBinding class is used to bind ProfileController
class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProfileController>(() => MyProfileController());
  }
}
