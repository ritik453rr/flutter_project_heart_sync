import 'package:get/get.dart';
import 'package:heart_sync/pages/signup/signup_controller.dart';

/// A Binding class for the SignUp screen.
class SignUpBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}