import 'package:get/get.dart';

/// DashboardController class is used to manage the state of the dashboard screen
class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  /// onTapNav method is used to change the current index of the bottom navigation bar
  void onTapNav(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    //requestPermissions();
    super.onInit();
  }

  /// Function to request the location permission
  void requestPermissions() async
  {
    // await NotificationServices.requestNotificationPermissions();
    // await Geolocator.requestPermission();
    
  }
}
