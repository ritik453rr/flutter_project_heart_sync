import 'package:get/get.dart';

import 'dashboard_controller.dart';

/// DashboardBinding class is used to bind DashboardController
class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}