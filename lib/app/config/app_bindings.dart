import 'package:get/get.dart';

import '../../core/storage/storage_service.dart';
import '../../core/network/network_service.dart';
import '../../presentation/controllers/theme_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Core Services
    Get.putAsync<StorageService>(() async {
      final service = StorageService();
      await service.onInit();
      return service;
    }, permanent: true);

    Get.putAsync<NetworkService>(() async {
      final service = NetworkService();
      await service.onInit();
      return service;
    }, permanent: true);

    // App Controllers
    Get.lazyPut<ThemeController>(() => ThemeController(), fenix: true);
  }
}
