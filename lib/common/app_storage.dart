import 'package:get_storage/get_storage.dart';

/// Manages local storage operations
class AppStorage {
  static final storage = GetStorage();

  /// Keys
  static const String isLoggedIn = 'isLoggedIn';

 /// method to set the login status
  static void setLoginStatus(bool status) {
    storage.write(isLoggedIn, status);
  }
  

  /// method to get the login status
  static bool getLoginStatus() {
    return storage.read(isLoggedIn) ?? false;
  }

} 