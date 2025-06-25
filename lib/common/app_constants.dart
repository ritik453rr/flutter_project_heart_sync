import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Contains all constants used in the application
class AppConstants {
  static const double hzPadding = 20;
  static const double bottomSpace = 40;
   static const tempImgUrl =
      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D";
  static const emptyImgUrl =
      "https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg";

  /// A method to hide the keyboard.
  static hideKeyboard(){
    return FocusManager.instance.primaryFocus?.unfocus();
  }

  /// A method to check the internet connection.
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  /// Function to show a datePicker according to the platform.
  static Future<DateTime?> showPlatformDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      DateTime? selectedDate;
      await showCupertinoModalPopup(
        context: context,
        builder:
            (_) => Container(
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: CupertinoDatePicker(
                      initialDateTime: initialDate,
                      minimumDate: firstDate ?? DateTime(1900),
                      maximumDate: lastDate ?? DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime newDate) {
                        selectedDate = newDate;
                      },
                    ),
                  ),
                  CupertinoButton(
                    child: const Text('Done'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
      );
      return selectedDate ?? initialDate;
    } else {
      return await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(1900),
        lastDate: lastDate ?? DateTime.now(),
      );
    }
  }

 
}
