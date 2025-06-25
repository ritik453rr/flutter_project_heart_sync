import 'package:get/get.dart';

import 'home_controller.dart';

/// HomeBinding class is used to bind the HomeController with HomeView
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
