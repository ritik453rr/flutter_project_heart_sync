import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/reauthentication/reauthentication_controller.dart';

/// A binding class for the ReauthenticationController.
class ReauthenticationBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReauthenticationController());
  }
}