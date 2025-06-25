import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/swipe/swipe_controller.dart';

/// SwipeBinding class is used to bind SwipeController
class SwipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SwipeController>(() => SwipeController());
  }
}