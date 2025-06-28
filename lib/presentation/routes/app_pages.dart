import 'package:get/get.dart';
import '../pages/auth/auth_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.auth, page: () => const AuthPage()),
    // Add other pages here
  ];
}
