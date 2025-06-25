import 'package:get/get.dart';
import 'package:heart_sync/pages/onboarding/onboarding_controller.dart';

/// A Binding class for the Onboarding screen.
class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}