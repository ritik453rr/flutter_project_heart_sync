import 'package:get/get.dart';
import 'package:heart_sync/common/app_storage.dart';
import 'package:heart_sync/routing/app_routes.dart';

/// A controller class that manages the splash screen functionality.
class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  /// Navigates to the appropriate screen based on the user's login status.
  void navigation() {
    var isLoggedIn = AppStorage.getLoginStatus();
    Future.delayed(const Duration(seconds: 1), () {
       isLoggedIn?Get.offNamed(AppRoutes.dashboard):
       Get.offNamed(AppRoutes.login);
    });
  }
}
