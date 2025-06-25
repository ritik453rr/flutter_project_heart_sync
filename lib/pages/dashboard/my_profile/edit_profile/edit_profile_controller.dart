import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';


/// A controller class for the EditProfileView
class EditProfileController extends GetxController {
  var selectedImages = List<File?>.filled(6, null).obs;
  var selectedInterests = <String>[].obs;
  var selectedPronouns = <String>[].obs;
  var selectedRelationshipType = <String>[].obs;
  var selectedLanguages = <String>[].obs;
  var selectedZodiac = <String>[].obs;
  var selectedEducation = <String>[].obs;
  var selectedFamilyPlan = <String>[].obs;
  var selectedCovidVaccination = <String>[].obs;
  var selectedPersonality = <String>[].obs;
  var selectedCommunication = <String>[].obs;
  var selectedLoveStyle = <String>[].obs;
  var selectedPets = <String>[].obs;
  var selectedDrinking = <String>[].obs;
  var selectedSmoking = <String>[].obs;
  var selectedWorkOut = <String>[].obs;
  var editProfileSelectionTitle = ''.obs;
  var editProfileSelectionLabel = ''.obs;
  var userHeight = ''.obs;
  var heightUnit = 'cm'.obs;

  //AppStorage appStorage = AppStorage();

  //final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController aboutMeController = TextEditingController();

  @override
  void onInit() {
   // initializeSelections();
    super.onInit();
  }

  /// Function to initialize the selections
  // void initializeSelections() {
  //   selectedInterests.value = List<String>.from(FireStoreServices.currentUser.interests);
  //   selectedPets.value = List<String>.from(FireStoreServices.currentUser.lifestyleAnswers['pets']?.split(',') ?? []);
  //   selectedDrinking.value = List<String>.from(FireStoreServices.currentUser.lifestyleAnswers['drink']?.split(',') ?? []);
  //   selectedSmoking.value = List<String>.from(FireStoreServices.currentUser.lifestyleAnswers['smoke']?.split(',') ?? []);
  //   selectedWorkOut.value = List<String>.from(FireStoreServices.currentUser.lifestyleAnswers['workout']?.split(',') ?? []);
  //   selectedCommunication.value = List<String>.from(FireStoreServices.currentUser.thoughtAnswers['communication']?.split(',') ?? []);
  //   selectedZodiac.value = List<String>.from(FireStoreServices.currentUser.thoughtAnswers['zodiac']?.split(',') ?? []);
  //   aboutMeController.text = FireStoreServices.currentUser.aboutMe;
  //   heightController.text = FireStoreServices.currentUser.height;
  //   userHeight.value = FireStoreServices.currentUser.height;
  //   selectedRelationshipType.value = List<String>.from(FireStoreServices.currentUser.relationshipType);
  //   selectedPronouns.value = List<String>.from(FireStoreServices.currentUser.pronouns);
  //   selectedLanguages.value = List<String>.from(FireStoreServices.currentUser.languages);
  //   selectedEducation.value = List<String>.from(FireStoreServices.currentUser.thoughtAnswers['education']?.split(',') ?? []);
  // }

  /// A Function to update the user height
  void updateUserHeight(String height) {
    userHeight.value = height;
  }

  /// Function to set the images
  void setImageAt(int index, XFile image) {
    selectedImages[index] = File(image.path);
    update();
  }

  /// Function to save the about me data to the firebase
  // Future<void> saveAboutMeToFirebase(String aboutMe) async
  // {
  //   try{
  //     final userId = appStorage.getFirebaseUUiD();
  //     FireStoreServices.getUser(uid: userId);
  //     await FirebaseFirestore.instance.collection('users').doc(userId).update({
  //       'aboutMe': aboutMe,
  //     });
  //     Get.back();
  //   }
  //   catch (e) {
  //     Get.snackbar("Error", "Failed to update about me: $e");
  //   }
  // }

  /// Function to save or update the data
  // Future<void> saveOrUpdateProfile() async
  // {
  //   try {
  //     final uid = appStorage.getFirebaseUUiD();

  //     final profileData = UserDataModel(
  //       height: userHeight.value,
  //       aboutMe: aboutMeController.text,
  //       interests: selectedInterests,
  //       pronouns: selectedPronouns,
  //       relationshipType: selectedRelationshipType,
  //       languages: selectedLanguages,
  //       thoughtAnswers: {
  //         'communication': selectedCommunication.join(','),
  //         'loveStyle': selectedLoveStyle.join(','),
  //         'education': selectedEducation.join(','),
  //         'zodiac': selectedZodiac.join(','),
  //       },
  //       lifestyleAnswers: {
  //         'drink': selectedDrinking.join(','),
  //         'smoke': selectedSmoking.join(','),
  //         'workout': selectedWorkOut.join(','),
  //         'pets': selectedPets.join(','),
  //       },
  //       familyPlan: selectedFamilyPlan.join(','),
  //       covidVaccination: selectedCovidVaccination.join(','),
  //       personalityType: selectedPersonality.join(','),
  //     );

  //     await fireStore.collection('users').doc(uid).set(profileData.toJson(), SetOptions(merge: true));

  //     Get.snackbar("Success", "Profile Updated Successfully",snackPosition: SnackPosition.BOTTOM);
  //   }
  //   catch (e) {
  //     Get.snackbar("Error", "Failed to update profile: $e");
  //   }
  // }

}

