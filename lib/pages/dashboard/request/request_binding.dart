import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/request/request_controller.dart';

/// A binding class for the RequestController.
class RequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestController>(
      () => RequestController(),
    );
  }
}