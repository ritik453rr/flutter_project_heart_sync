import 'package:get/get.dart';
import 'package:heart_sync/language/app_strings.dart';

/// This class is used to store all the translations used in the app
class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      /// Login Page
      AppStrings.textEmail: 'Email',
      AppStrings.textPassword: 'Password',
      AppStrings.textLogin: 'Login',
      AppStrings.textForgotPassword: 'Forgot Password',
      AppStrings.textSignUp: 'Sign Up',
      AppStrings.textDontHaveAccount: 'Don\'t have an account',
      AppStrings.textLoginTitle: 'Existing Users,\nLog In Here',
      AppStrings.textNoInternetConnection: "No internet connection",
      AppStrings.textOk: "OK",
      AppStrings.textNoUsersFound: "'Wrong password. Please try again.'",
      AppStrings.textInvalidCredentials:
          'Invalid credentials. Please try again.',
      AppStrings.textUnExpectedError:
          'An unexpected error occurred. Please try again later.',
      AppStrings.textEnterEmail: "Please enter your email",
      AppStrings.textEnterValidEmail: "Please enter valid email",
      AppStrings.textEnterPassword: "Please enter your password",
      AppStrings.textContinueWithGoogle: "Continue with Google",

      /// SignUp Page
      AppStrings.textSignUpTitle: "New User?\nRegister Here",
      AppStrings.textConfirmPassword: "Confirm Password",
      AppStrings.textAlreadyHaveAccount: "Already have an account",
      AppStrings.textPasswordLengthConstraint:
          'Password length must be at least 8 characters',
      AppStrings.textPasswordsDoNotMatch: 'Passwords do not match',
      AppStrings.textError: 'Error',
      AppStrings.textSuccess: 'Success',
      AppStrings.textUserCreatedSuccessfully: 'User created successfully',
      AppStrings.textPasswordIsTooWeak: 'The password is too weak.',
      AppStrings.textEmailAlreadyInUse:
          'The account already exists for that email.',
      AppStrings.textSignInFailed: 'Sign-in failed. Please try again.',

      /// Forgot Password Page
      AppStrings.textResetPassword: 'Reset Password',

      /// Onboarding Page
      AppStrings.textSkip: 'Skip',
      AppStrings.textNext: 'Next',
      AppStrings.textDone: 'Done',

      /// Dashboard Page
      AppStrings.textNewMatches: 'New Matches',
      AppStrings.textNearYou: 'Near You',
      AppStrings.textMatch: 'Match',
      AppStrings.textKmAway: 'km Away',

      AppStrings.textAppName: 'VibeMate',

      /// Profile Page
      AppStrings.textChangePassword: 'Change Password',
      AppStrings.textUpdate: 'Update',
      AppStrings.textDeleteAccount: 'Delete Account',
      AppStrings.textYes: 'Yes',
      AppStrings.textNo: 'No',
      AppStrings.textLogOut: 'Log Out',
      AppStrings.textLogOutTitle:
          'Are you sure you want to logout from your account',

      /// Message Page
      AppStrings.textSearch: "Search",
      AppStrings.textChats: "Chats",
      AppStrings.textNoMessagesFound: 'No messages found',
      AppStrings.textProfile: 'Profile',
      AppStrings.textSettings: 'Settings',
      AppStrings.textPrivacy: 'Privacy Policy',
      AppStrings.textContactUs: 'Contact Us',

      /// Find Match Page
      AppStrings.textFindMatch: 'Find Match',

      /// Edit Profile Page
      AppStrings.textFullName: 'Full Name',
      AppStrings.textDeleteAccountMsg:
          'Are you sure you want to delete your account',
      AppStrings.textEditProfile: 'Edit Profile',
      AppStrings.textPronouns: 'Pronouns',
      AppStrings.textAddInterests: 'Add Interests',
      AppStrings.textAddPronouns: 'Add Pronouns',
      AppStrings.textHeight: 'Height',
      AppStrings.textAddHeight: 'Add Height',
      AppStrings.textRelationShipType: 'Relationship Type',
      AppStrings.textOpenTo: 'Open to....',
      AppStrings.textLanguages: 'Languages',
      AppStrings.textAddLanguages: 'Add Languages',
      AppStrings.textBasic: 'Basic',
      AppStrings.textZodiac: 'Zodiac',
      AppStrings.textEducation: 'Education',
      AppStrings.textFamilyPlans: 'Family Plans',
      AppStrings.textCovidVaccine: 'COVID Vaccine',
      AppStrings.textPersonalityType: 'Personality Type',
      AppStrings.textCommunicationStyle: 'Communication Style',
      AppStrings.textLoveStyle: 'Love Style',
      AppStrings.textLifeStyle: 'Lifestyle',
      AppStrings.textInterests: 'Interests',
      AppStrings.textRelationShipGoals: 'Relationship Goals',
      AppStrings.textAboutMe: 'About Me',
      AppStrings.textGender: 'Gender',
      AppStrings.textPets: 'Pets',
      AppStrings.textDrinking: 'Drinking',
      AppStrings.textSmoking: 'Smoking',
      AppStrings.textWorkOut: 'Workout',

      /// Settings Page
      AppStrings.textPriorityLikes:
          'Priority Likes, see who Likes you, and more.',
      AppStrings.textAccountSettings: 'Account Settings',
      AppStrings.textDistance: 'Distance',
      AppStrings.textShareVibeMate: 'Share VibeMate',
      AppStrings.textLocation: 'Location',
      AppStrings.textLoveStyle: 'Love Style',
      AppStrings.textLifeStyle: 'Lifestyle',
      AppStrings.textInterests: 'Interests',
      AppStrings.textRelationShipGoals: 'Relationship Goals',
      AppStrings.textAboutMe: 'About Me',
      AppStrings.textGender: 'Gender',
      AppStrings.textPets: 'Pets',
      AppStrings.textDrinking: 'Drinking',
      AppStrings.textSmoking: 'Smoking',
      AppStrings.textWorkOut: 'Workout',

      /// Chat Page
      AppStrings.textSoulmate: "Soul Mate",
      AppStrings.textDeleteChat: "Delete Chat",
      AppStrings.textDeleteChatSubTitle:
          "Are you sure you want to delete this chat",
      AppStrings.textNoChat: "No chat found",
      AppStrings.textTypeYourMessage: "Type your message",
      AppStrings.textStartConversation: "Start a conversation..!!",

      /// Detail Page
      AppStrings.textLookingFor: "Looking for",
      AppStrings.textAboutMe: "About me",
      AppStrings.textEssentials: "Essentials",
      AppStrings.textInterests: "Interests",
      AppStrings.textBlock: "Block",
      AppStrings.textBlockTo: "Block to",
      AppStrings.textReport: "Report",
      AppStrings.textReportUser: "Report User",
      AppStrings.textShare: "Share",
      AppStrings.textCancel: "Cancel",
      AppStrings.textDelete: "Delete",
      AppStrings.textSpam: "Spam",
      AppStrings.textInappropriateContent: "Inappropriate Content",
      AppStrings.textHarassment: "Harassment",
      AppStrings.textFakeProfile: "Fake Profile",
      AppStrings.textScam: "Scam",
      AppStrings.textOthers: "Others",
      AppStrings.textSelectReasonToBlock: "Select a reason to report",
      AppStrings.textAdd: "Add",
      AppStrings.textNoBioAdded: "No bio added yet",
      AppStrings.textBasicInfo: "Basic Info",
      AppStrings.textPreferences: "Preferences",
      AppStrings.textDateOfBirth: "Date of Birth",

      /// Home
      AppStrings.textVibeMate: "VibeMate",

      /// Message Page
      AppStrings.textAddFriendsToConversation:
          'Add friends to start conversation',

      /// Notification Page
      AppStrings.textNotifications: 'Notifications',
      AppStrings.textFriendRequests: 'Friend Requests',
      AppStrings.textAcceptOrDeclineRequest: 'Accept or decline request',
      AppStrings.textSuggestedForYou: 'Suggested for you',

      /// Request Page
      AppStrings.textNoRequests: 'No requests',

      /// Request Page
      AppStrings.textRequested: "Requested",

      /// Swipe View
      AppStrings.textLike: 'Like',
      AppStrings.textNope: 'Nope',
    },
  };
}
