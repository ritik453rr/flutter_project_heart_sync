import 'package:get/get.dart';
import 'package:heart_sync/language/strings.dart';

/// This class is used to store all the translations used in the app
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      /// Login Page
      Strings.textEmail: 'Email',
      Strings.textPassword: 'Password',
      Strings.textLogin: 'Login',
      Strings.textForgotPassword: 'Forgot Password',
      Strings.textSignUp: 'Sign Up',
      Strings.textDontHaveAccount: 'Don\'t have an account',
      Strings.textLoginTitle: 'Existing Users,\nLog In Here',
      Strings.textNoInternetConnection: "No internet connection",

      /// Onboarding Page
      Strings.textSkip: 'Skip',
      Strings.textNext: 'Next',
      Strings.textDone: 'Done',

      /// Dashboard Page
      Strings.textNewMatches: 'New Matches',
      Strings.textNearYou: 'Near You',
      Strings.textMatch: 'Match',
      Strings.textKmAway: 'km Away',

      Strings.textAppName: 'VibeMate',

      

      /// SignUp Page
      Strings.textSignUpTitle: "New User?\nRegister Here",
      Strings.textConfirmPassword: "Confirm Password",
      Strings.textAlreadyHaveAccount: "Already have an account",

      /// Profile Page
      Strings.textChangePassword: 'Change Password',
      Strings.textUpdate: 'Update',
      Strings.textDeleteAccount: 'Delete Account',
      Strings.textYes: 'Yes',
      Strings.textNo: 'No',
      Strings.textLogOut: 'Log Out',
      Strings.textLogOutTitle:
          'Are you sure you want to logout from your account',

      /// Message Page
      Strings.textSearch: "Search",
      Strings.textChats: "Chats",
      Strings.textNoMessagesFound: 'No messages found',
      Strings.textProfile: 'Profile',
      Strings.textSettings: 'Settings',
      Strings.textPrivacy: 'Privacy Policy',
      Strings.textContactUs: 'Contact Us',

      /// Find Match Page
      Strings.textFindMatch: 'Find Match',

      /// Edit Profile Page
      Strings.textFullName: 'Full Name',
      Strings.textDeleteAccountMsg:
          'Are you sure you want to delete your account',
      Strings.textEditProfile: 'Edit Profile',
      Strings.textPronouns: 'Pronouns',
      Strings.textAddInterests: 'Add Interests',
      Strings.textAddPronouns: 'Add Pronouns',
      Strings.textHeight: 'Height',
      Strings.textAddHeight: 'Add Height',
      Strings.textRelationShipType: 'Relationship Type',
      Strings.textOpenTo: 'Open to....',
      Strings.textLanguages: 'Languages',
      Strings.textAddLanguages: 'Add Languages',
      Strings.textBasic: 'Basic',
      Strings.textZodiac: 'Zodiac',
      Strings.textEducation: 'Education',
      Strings.textFamilyPlans: 'Family Plans',
      Strings.textCovidVaccine: 'COVID Vaccine',
      Strings.textPersonalityType: 'Personality Type',
      Strings.textCommunicationStyle: 'Communication Style',
      Strings.textLoveStyle: 'Love Style',
      Strings.textLifeStyle: 'Lifestyle',
      Strings.textInterests: 'Interests',
      Strings.textRelationShipGoals: 'Relationship Goals',
      Strings.textAboutMe: 'About Me',
      Strings.textGender: 'Gender',
      Strings.textPets: 'Pets',
      Strings.textDrinking: 'Drinking',
      Strings.textSmoking: 'Smoking',
      Strings.textWorkOut: 'Workout',

      /// Settings Page
      Strings.textPriorityLikes: 'Priority Likes, see who Likes you, and more.',
      Strings.textAccountSettings: 'Account Settings',
      Strings.textDistance: 'Distance',
      Strings.textShareVibeMate: 'Share VibeMate',
      Strings.textLocation: 'Location',
      Strings.textLoveStyle: 'Love Style',
      Strings.textLifeStyle: 'Lifestyle',
      Strings.textInterests: 'Interests',
      Strings.textRelationShipGoals: 'Relationship Goals',
      Strings.textAboutMe: 'About Me',
      Strings.textGender: 'Gender',
      Strings.textPets: 'Pets',
      Strings.textDrinking: 'Drinking',
      Strings.textSmoking: 'Smoking',
      Strings.textWorkOut: 'Workout',

      /// Chat Page
      Strings.textSoulmate: "Soul Mate",
      Strings.textDeleteChat: "Delete Chat",
      Strings.textDeleteChatSubTitle:
          "Are you sure you want to delete this chat",
      Strings.textNoChat: "No chat found",
      Strings.textTypeYourMessage: "Type your message",
      Strings.textStartConversation: "Start a conversation..!!",

      /// Detail Page
      Strings.textLookingFor: "Looking for",
      Strings.textAboutMe: "About me",
      Strings.textEssentials: "Essentials",
      Strings.textInterests: "Interests",
      Strings.textBlock: "Block",
      Strings.textBlockTo: "Block to",
      Strings.textReport: "Report",
      Strings.textReportUser: "Report User",
      Strings.textShare: "Share",
      Strings.textCancel: "Cancel",
      Strings.textDelete: "Delete",
      Strings.textSpam: "Spam",
      Strings.textInappropriateContent: "Inappropriate Content",
      Strings.textHarassment: "Harassment",
      Strings.textFakeProfile: "Fake Profile",
      Strings.textScam: "Scam",
      Strings.textOthers: "Others",
      Strings.textSelectReasonToBlock: "Select a reason to report",
      Strings.textAdd: "Add",
      Strings.textNoBioAdded: "No bio added yet",
      Strings.textBasicInfo: "Basic Info",
      Strings.textPreferences: "Preferences",
      Strings.textDateOfBirth: "Date of Birth",

      /// Home
      Strings.textVibeMate: "VibeMate",

      /// Message Page
      Strings.textAddFriendsToConversation: 'Add friends to start conversation',

      /// Notification Page
      Strings.textNotifications: 'Notifications',
      Strings.textFriendRequests: 'Friend Requests',
      Strings.textAcceptOrDeclineRequest: 'Accept or decline request',
      Strings.textSuggestedForYou: 'Suggested for you',

      /// Request Page
      Strings.textNoRequests: 'No requests',

      /// Request Page
      Strings.textRequested: "Requested",

      /// Swipe View
      Strings.textLike: 'Like',
      Strings.textNope: 'Nope',
    },
  };
}
