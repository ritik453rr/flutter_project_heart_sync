import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/setting_controller.dart';

/// A binding class for the settings page in the application.
class SettingBinding extends Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}