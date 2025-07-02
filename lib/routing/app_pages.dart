import 'package:get/get.dart';
import 'package:heart_sync/pages/dashboard/chat/chat_binding.dart';
import 'package:heart_sync/pages/dashboard/chat/chat_view.dart';
import 'package:heart_sync/pages/dashboard/dashboard_main/dashboard_binding.dart';
import 'package:heart_sync/pages/dashboard/dashboard_main/dashboard_view.dart';
import 'package:heart_sync/pages/dashboard/detail_page/detail_page_binding.dart';
import 'package:heart_sync/pages/dashboard/detail_page/detail_page_view.dart';
import 'package:heart_sync/pages/dashboard/home/home_binding.dart';
import 'package:heart_sync/pages/dashboard/home/home_view.dart';
import 'package:heart_sync/pages/dashboard/message/message_binding.dart';
import 'package:heart_sync/pages/dashboard/message/message_view.dart';
import 'package:heart_sync/pages/dashboard/my_profile/edit_profile/edit_profile_binding.dart';
import 'package:heart_sync/pages/dashboard/my_profile/edit_profile/edit_profile_view.dart';
import 'package:heart_sync/pages/dashboard/my_profile/my_profile_view.dart';
import 'package:heart_sync/pages/dashboard/my_profile/my_profle_binding.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/reauthentication/reauthentication_binding.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/reauthentication/reauthentication_view.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/setting_binding.dart';
import 'package:heart_sync/pages/dashboard/my_profile/setting/setting_view.dart';
import 'package:heart_sync/pages/dashboard/request/request_binding.dart';
import 'package:heart_sync/pages/dashboard/request/request_view.dart';
import 'package:heart_sync/pages/dashboard/search_user/search_user_binding.dart';
import 'package:heart_sync/pages/dashboard/search_user/search_user_view.dart';
import 'package:heart_sync/pages/dashboard/swipe/swipe_binding.dart';
import 'package:heart_sync/pages/dashboard/swipe/swipe_view.dart';
import 'package:heart_sync/pages/forgot_password/forgot_password_binding.dart';
import 'package:heart_sync/pages/forgot_password/forgot_password_view.dart';
import 'package:heart_sync/pages/login/login_binding.dart';
import 'package:heart_sync/pages/login/login_view.dart';
import 'package:heart_sync/pages/onboarding/onboarding_binding.dart';
import 'package:heart_sync/pages/onboarding/onboarding_view.dart';
import 'package:heart_sync/pages/signup/signup_binding.dart';
import 'package:heart_sync/pages/signup/signup_view.dart';
import 'package:heart_sync/pages/splash/splash_binding.dart';
import 'package:heart_sync/pages/splash/splash_view.dart';
import 'app_routes.dart';

/// Contains all the pages/routes used in the application
class AppPages {
  /// List of all pages/routes
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        SwipeBinding(),
        MyProfileBinding(),
        MessageBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.swipe,
      page: () => SwipeView(),
      binding: SwipeBinding(),
    ),
    GetPage(
      name: AppRoutes.message,
      page: () => MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.myProfile,
      page: () => MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.searchUser,
      page: () => SearchUserView(),
      binding: SearchUserBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.detailPage,
      page: () => DetailPageView(),
      binding: DetailPageBinding(),
    ),

    GetPage(
      name: AppRoutes.request,
      page: () => RequestView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.reauthentication,
      page: () => ReauthenticationView(),
      binding: ReauthenticationBinding(),
    ),
  ];
}
