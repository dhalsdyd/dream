import 'package:dream/app/pages/home/binding.dart';
import 'package:dream/app/pages/home/page.dart';
import 'package:dream/app/pages/login/binding.dart';
import 'package:dream/app/pages/login/page.dart';
import 'package:dream/app/pages/new_dream/binding.dart';
import 'package:dream/app/pages/new_dream/page.dart';
import 'package:dream/app/pages/onboarding/binding.dart';
import 'package:dream/app/pages/onboarding/page.dart';
import 'package:dream/app/routes/route.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomePage(), binding: HomePageBinding()),
    GetPage(name: Routes.new_dream, page: () => const NewDreamPage(), binding: NewDreamPageBinding()),
    GetPage(name: Routes.login, page: () => const LoginPage(), binding: LoginPageBinding()),
    GetPage(name: Routes.onboarding, page: () => const OnboardingPage(), binding: OnboardingPageBinding()),
  ];
}
