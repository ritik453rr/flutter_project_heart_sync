import 'package:get/get.dart';


/// MyProfileController class is used to manage the state of the MyProfileView
class MyProfileController extends GetxController
{
  @override
  void onInit() {
    //FireStoreServices.getUser(uid: AppStorage().getFirebaseUUiD());
    super.onInit();
  }

  /// Function to launch the app's privacy policy
  void launchPrivacyPolicy() async {
    // const url = "https://www.vidmate-official.com/privacy.html";
    // try {
    //   final uri = Uri.parse(url);
    //   if (await canLaunchUrl(uri)) {
    //     await launchUrl(uri);
    //   } else {
    //     debugPrint("Could not launch $url");
    //   }
    // } catch (e) {
    //   debugPrint("Error launching URL: $e");
    // }
  }

  /// Function to launch the email
  // void launchEmail() async {
  //   final Uri emailLaunchUri = Uri(
  //     scheme: 'mailto',
  //     path: 'ankit123@gmail.com',
  //     queryParameters: {
  //       'body': 'Hello, I would like to provide feedback about the app.',
  //       'subject': 'Feedback from Vibemate',
  //     },
  //   );
  //   launchUrl(emailLaunchUri).then((value) {
  //     ;
  //     debugPrint("Email launched successfully");
  //   }).catchError((error) {
  //     debugPrint("Error launching email: $error");
  //   });
  // }
}
