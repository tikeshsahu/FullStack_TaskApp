import 'package:get/get.dart';

import '../../presentation/pages/splash/splash_page.dart';
import '../../presentation/pages/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    // Splash
    GetPage(name: _Paths.splash, page: () => const SplashPage()),

    // Home
    GetPage(name: _Paths.home, page: () => const HomePage()),
  ];
}
