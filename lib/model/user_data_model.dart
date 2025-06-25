/// A model class representing user data for onboarding.
class UserDataModel {
  final String uid;
  final String name;
  final String dob;
  final String email;
  final String fcmToken;
  final String gender;
  final String lookingFor;
  final int distance;
  final String school;
  final Map<String, String> lifestyleAnswers;
  final Map<String, String> thoughtAnswers;
  final List<String> interests;
  List<String> imageUrls;
  String aboutMe;
  String height;
  final List<String> pronouns;
  final List<String> relationshipType;
  final List<String> languages;
  final String familyPlan;
  final String covidVaccination;
  final String personalityType;
  final String communicationStyle;
  final String loveStyle;
  String? profileImageUrl;

  UserDataModel({
    this.uid = '',
    this.name = '',
    this.dob = '',
    this.email = '',
    this.fcmToken = '',
    this.gender = '',
    this.lookingFor = '',
    this.distance = 0,
    this.school = '',
    this.lifestyleAnswers = const {},
    this.thoughtAnswers = const {},
    this.interests = const [],
    this.imageUrls = const [],
    this.aboutMe = '',
    this.height = '',
    this.pronouns = const [],
    this.relationshipType = const [],
    this.languages = const [],
    this.familyPlan = '',
    this.covidVaccination = '',
    this.personalityType = '',
    this.communicationStyle = '',
    this.loveStyle = '',
    this.profileImageUrl,
  });

  /// Factory constructor to create a UserDataModel from JSON.
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      dob: json['dob'] ?? '',
      email: json['email'] ?? '',
      fcmToken: json['fcmToken'] ?? '',
      interests: List<String>.from(json['interests'] ?? []),
      gender: json['gender'] ?? '',
      lookingFor: json['lookingFor'] ?? '',
      distance: json['distance'] ?? 0,
      school: json['school'] ?? '',
      lifestyleAnswers: Map<String, String>.from(
        json['lifestyleAnswers'] ?? {},
      ),
      thoughtAnswers: Map<String, String>.from(json['thoughtAnswers'] ?? {}),
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      profileImageUrl: json['profileImageUrl'],
      aboutMe: json['aboutMe'] ?? '',
      height: json['height'] ?? '',
      pronouns: List<String>.from(json['pronouns'] ?? []),
      relationshipType: List<String>.from(json['relationshipType'] ?? []),
      languages: List<String>.from(json['languages'] ?? []),
      familyPlan: json['familyPlan'] ?? '',
      covidVaccination: json['covidVaccination'] ?? '',
      personalityType: json['personalityType'] ?? '',
      loveStyle: json['loveStyle'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (uid.isNotEmpty) data['uid'] = uid;
    if (name.isNotEmpty) data['name'] = name;
    if (dob.isNotEmpty) data['dob'] = dob;
    if (gender.isNotEmpty) data['gender'] = gender;
    if (email.isNotEmpty) data['email'] = email;
    if (fcmToken.isNotEmpty) data['fcmToken'] = fcmToken;
    if (lookingFor.isNotEmpty) data['lookingFor'] = lookingFor;
    if (distance > 0) data['distance'] = distance;
    if (school.isNotEmpty) data['school'] = school;
    if (lifestyleAnswers.isNotEmpty) data['lifestyleAnswers'] = lifestyleAnswers;
    if (thoughtAnswers.isNotEmpty) data['thoughtAnswers'] = thoughtAnswers;
    if (interests.isNotEmpty) data['interests'] = interests;
    if (imageUrls.isNotEmpty) data['imageUrls'] = imageUrls;
    if (aboutMe.isNotEmpty) data['aboutMe'] = aboutMe;
    if (height.isNotEmpty) data['height'] = height;
    if (pronouns.isNotEmpty) data['pronouns'] = pronouns;
    if (relationshipType.isNotEmpty) {
      data['relationshipType'] = relationshipType;
    }
    if (languages.isNotEmpty) data['languages'] = languages;
    if (familyPlan.isNotEmpty) data['familyPlan'] = familyPlan;
    if (covidVaccination.isNotEmpty) {
      data['covidVaccination'] = covidVaccination;
    }
    if (personalityType.isNotEmpty) data['personalityType'] = personalityType;
    if (communicationStyle.isNotEmpty) {
      data['communicationStyle'] = communicationStyle;
    }
    if (loveStyle.isNotEmpty) data['loveStyle'] = loveStyle;
    if (profileImageUrl != null) data['profileImageUrl'] = profileImageUrl;
    return data;
  }
}


