import 'package:get/get.dart';

import '../../presentation/pages/splash/splash_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/auth/signup_page.dart';
import '../../presentation/pages/profile_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    // Splash
    GetPage(name: _Paths.splash, page: () => const SplashPage()),

    // Authentication
    GetPage(name: _Paths.login, page: () => const LoginPage()),
    GetPage(name: _Paths.signup, page: () => const SignUpPage()),

    // Home
    GetPage(name: _Paths.home, page: () => const HomePage()),

    // Profile
    GetPage(name: _Paths.profile, page: () => const ProfilePage()),
  ];
}
