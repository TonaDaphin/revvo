part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const HOME = _Paths.HOME;
  static const SEARCH = _Paths.SEARCH;
  static const PROFILE = _Paths.PROFILE;
  static const NAVIGATE = _Paths.NAVIGATE;
}

abstract class _Paths {
  _Paths._();
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const PROFILE = '/profile';
  static const NAVIGATE = '/navigate';
}
