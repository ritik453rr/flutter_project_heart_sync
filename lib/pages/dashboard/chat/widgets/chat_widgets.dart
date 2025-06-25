import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/common_ui.dart';

/// A function that builds a your message widget.
Widget yourMsg(String msg) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Neumorphic(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            style: CommonUI.customNeuMorphismStyle(),
            child: Text(msg),
          ),
        ),
        CommonUI.profileImg(
          imageUrl: AppConstants.tempImgUrl,
          height: 30,
          leftMargin: 5,
          rightMargin: 20,
          topMargin: 0,
          padding: 2,
        ),
      ],
    ),
  );
}

/// A function that builds the response message widget.
Widget responseMsg(String msg) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonUI.profileImg(
          imageUrl: AppConstants.tempImgUrl,
          height: 30,
          leftMargin: 20,
          topMargin: 0,
          padding: 2,
        ),
        Expanded(
          child: Neumorphic(
            margin: EdgeInsets.only(left: 5, right: 20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            style: CommonUI.customNeuMorphismStyle(),
            child: Text(msg),
          ),
        ),
      ],
    ),
  );
}
