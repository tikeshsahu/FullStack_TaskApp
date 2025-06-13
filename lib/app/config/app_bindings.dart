import 'package:get/get.dart';

import '../../core/network/network_service.dart';
import '../../presentation/controllers/theme_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Core Services
    Get.put<NetworkController>(NetworkController(), permanent: true);

    // App Controllers
    Get.put<ThemeController>(ThemeController());
  }
}
