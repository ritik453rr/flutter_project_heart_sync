import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/message/message_controller.dart';

/// MessageBinding class is used to bind MessageController
class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}