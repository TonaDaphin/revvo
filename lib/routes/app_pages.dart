import 'package:get/get.dart';
import 'package:yelp/modules/review/bindings/profile.dart';
import 'package:yelp/modules/review/views/profile.dart';
import 'package:yelp/modules/search/bindings/search.dart';
import 'package:yelp/modules/search/views/search.dart';

import '../modules/home/bindings/home.dart';
import '../modules/home/views/home.dart';
import '../modules/login/bindings/login.dart';
import '../modules/login/views/login.dart';
import '../modules/onboarding/bindings/onboarding.dart';
import '../modules/onboarding/views/onboarding.dart';
import '../modules/signup/bindings/signup.dart';
import '../modules/signup/views/signup.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
