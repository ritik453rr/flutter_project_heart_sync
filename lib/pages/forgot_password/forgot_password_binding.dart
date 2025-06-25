import 'package:get/get.dart';
import 'package:heart_sync/pages/forgot_password/forgot_password_controller.dart';

/// A binding class for the Forgot Password screen.
class ForgotPasswordBinding extends Bindings
{
  @override
  void dependencies()
  {
    Get.lazyPut(() => ForgotPasswordController());
  }
}