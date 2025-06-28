part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const auth = _Paths.auth;
  static const home = _Paths.home;
  static const profile = _Paths.profile;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const auth = '/auth';
  static const home = '/home';
  static const profile = '/profile';
}
