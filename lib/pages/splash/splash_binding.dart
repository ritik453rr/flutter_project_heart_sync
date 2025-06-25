import 'package:get/get.dart';
import 'package:heart_sync/pages/splash/splash_controller.dart';

/// A class that manages the dependencies for the Splash screen.
class SplashBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}