import 'package:get/get.dart';

import 'detail_page_controller.dart';

/// Binding class for the DetailPage.
class DetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPageController>(() => DetailPageController());
  }
}
