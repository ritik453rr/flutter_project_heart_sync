import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_sync/common/app_constants.dart';
import 'package:heart_sync/common/static_resources.dart';
import 'package:heart_sync/model/user_data_model.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/common_question_page.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/distance_page.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/dob_page.dart'
    show DobPage;
import 'package:heart_sync/pages/onboarding/onboarding_pages/gender_page.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/interest_page.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/looking_for_page.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/name_page.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/school_page.dart';
import 'package:heart_sync/pages/onboarding/onboarding_pages/upload_picture_page.dart';
import 'package:heart_sync/routing/app_routes.dart';
import 'package:image_picker/image_picker.dart';

/// A Controller class for the Onboarding screen.
class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  final RxList<File?> selectedImages = List<File?>.filled(6, null).obs;
  var progressValue = 0.1.obs;
  var dob = DateTime.now().obs;
  var selectedGenderIndex = (-1).obs;
  var selectedLookingForIndex = (-1).obs;
  var distanceProgressValue = 1.obs;
  final Map<String, String> selectedAnswers = {};
  final List<String> selectedInterest = [];
  //AppStorage appStorage = AppStorage();
  var isLoading = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();

  /// List of onboarding pages.
  final List<Widget> onboardingPages = [
    NamePage(),
    DobPage(),
    GenderPage(),
    LookingForPage(),
    DistancePage(),
    SchoolPage(),
    CommonQuestionPage(
      title: "Let's talk lifestyle habits, John",
      subTitle: 'Do their habits match yours? You go first..',
      questionList: StaticResources.lifeStyleOptionList,
    ),
    CommonQuestionPage(
      title: "What else makes you-you",
      subTitle: 'Don\'t hold back. Authenticity attracts authenticity',
      questionList: StaticResources.thoughtOptionList,
    ),
    InterestPage(interestList: StaticResources.interestOptionList),
    UploadPicturePage(),
  ];

  /// Function to handle the gender selection
  void selectGender(int index) {
    selectedGenderIndex.value = index;
  }

  /// Function to handle the looking for selection
  void selectLookingFor(int index) {
    selectedLookingForIndex.value = index;
  }

  /// Function to handle the distance range slider
  void onDistanceRangeChange(double value) =>
      distanceProgressValue.value = value.toInt();

  /// Stores or updates the selected answer for a specific question.
  void selectAnswer(String questionTitle, String selectedOption) {
    selectedAnswers[questionTitle] = selectedOption;
    update();
  }

  /// Retrieves the selected answer for a specific question, if any.
  String? getSelectedOption(String questionTitle) {
    return selectedAnswers[questionTitle];
  }

  /// Function to set the images
  void setImageAt(int index, XFile image) {
    selectedImages[index] = File(image.path);
    update();
  }

  /// Function for the date picker
  void setDate(DateTime date) {
    dob.value = date;
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    dobController.text = "$day/$month/$year";
  }

  /// Function to handle the change in the LinearPercentIndicator
  void onLinearPercentIndicatorChange(int index) =>
      progressValue.value = (index + 1) / onboardingPages.length;

  /// Function to handle page navigation.
  void handlePageNavigation() async {
    if (checkButtonEnabled()) {
      if (currentPage.value == onboardingPages.length - 1) {
        isLoading.value = true;
        saveUserDataToFirebase(await getUserData());
        //appStorage.saveOnboardingStatus(true);
        isLoading.value = false;
        Get.offNamed(AppRoutes.dashboard);
      } else {
        AppConstants.hideKeyboard();
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Please fill or select the required fields",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    }
  }

  /// Function to handle the backPress event in the PageView
  void handleBackPress() {
    if (currentPage.value == 0) {
      Get.back();
    } else {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Function to check that the Button is enabled or not
  bool checkButtonEnabled() {
    switch (currentPage.value) {
      case 0:
        return nameController.text.trim().isNotEmpty;
      case 1:
        return dobController.text.trim().isNotEmpty;
      case 2:
        return selectedGenderIndex.value != -1;
      case 3:
        return selectedLookingForIndex.value != -1;
      case 4:
        return true;
      case 5:
        return schoolController.text.trim().isNotEmpty;
      case 6:
        return StaticResources.lifeStyleOptionList.any(
          (q) => selectedAnswers.containsKey(q.title),
        );
      case 7:
        return StaticResources.thoughtOptionList.any(
          (q) => selectedAnswers.containsKey(q.title),
        );
      case 8:
        return selectedInterest.isNotEmpty;
      case 9:
        return selectedImages.where((image) => image != null).length >= 2;
      default:
        return false;
    }
  }

  /// Function to get the user data from the onboarding
  Future<UserDataModel> getUserData() async {
    final name = nameController.text.trim();
    final dobStr = dobController.text.trim();
    //var email = appStorage.getCurrentUserEmail();
    // var fcmToken = await NotificationServices.getFCMToken();
    final gender =
        StaticResources.genderOptionList[selectedGenderIndex.value].title;
    final lookingFor =
        StaticResources
            .lookingForOptionList[selectedLookingForIndex.value]
            .title;
    final school = schoolController.text.trim();
    final distance = distanceProgressValue.value;

    final lifestyleAnswers = {
      for (var q in StaticResources.lifeStyleOptionList)
        q.key: selectedAnswers[q.title] ?? '',
    };

    final thoughtAnswers = {
      for (var q in StaticResources.thoughtOptionList)
        q.key: selectedAnswers[q.title] ?? '',
    };

    final interest =
        selectedInterest.map((interest) {
          return StaticResources.interestOptionList.firstWhere(
            (option) => option == interest,
          );
        }).toList();

    // final imagePaths = selectedImages.whereType<File>().map((file) => file.path).toList() ?? [];

    return UserDataModel(
      name: name,
      dob: dobStr,
      email: "Test Email",
      fcmToken: "Test FCM Token",
      uid: "Test UID",
      height: "",
      gender: gender,
      lookingFor: lookingFor,
      distance: distance,
      school: school,
      lifestyleAnswers: lifestyleAnswers,
      thoughtAnswers: thoughtAnswers,
      interests: interest,
      imageUrls: [
        "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg",
        "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg",
      ],
    );
  }

  /// Function to save the date to the Firebase
  Future<void> saveUserDataToFirebase(UserDataModel user) async {
    try {
      //final uid = appStorage.getFirebaseUUiD();
      /// await FirebaseFirestore.instance.collection('users').doc(uid).set(user.toJson());
      // appStorage.saveOnboardingStatus(true);
      Get.offAllNamed(AppRoutes.dashboard);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save user data. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
