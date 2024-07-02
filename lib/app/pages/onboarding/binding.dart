import 'package:dream/app/pages/calander/controller.dart';
import 'package:dream/app/pages/onboarding/controller.dart';
import 'package:get/get.dart';

class OnboardingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingPageController>(() => OnboardingPageController());
    Get.lazyPut<CalanderPageController>(() => CalanderPageController());
  }
}
