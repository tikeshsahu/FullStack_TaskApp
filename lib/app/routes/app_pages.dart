import 'package:get/get.dart';
import 'package:task_manager_fullstack/presentation/pages/auth/auth_page.dart';
import 'package:task_manager_fullstack/presentation/pages/home_page.dart';
import 'package:task_manager_fullstack/presentation/pages/profile_page.dart';

import '../../presentation/pages/splash/splash_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    // Splash
    GetPage(name: _Paths.splash, page: () => const SplashPage()),

    // Authentication
    GetPage(name: _Paths.auth, page: () => const AuthPage()),

    // Home
    GetPage(name: _Paths.home, page: () => const HomePage()),

    // Profile
    GetPage(name: _Paths.profile, page: () => const ProfilePage()),
  ];
}
