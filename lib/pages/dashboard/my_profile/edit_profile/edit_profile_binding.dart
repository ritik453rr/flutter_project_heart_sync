import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/my_profile/edit_profile/edit_profile_controller.dart';

/// EditProfileBinding class is used to bind EditProfileController
class EditProfileBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }
}