import 'package:get/get.dart';
import 'package:heart_sync/pages/login/login_controller.dart';

/// A Binding class for the Login screen.
class LoginBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}