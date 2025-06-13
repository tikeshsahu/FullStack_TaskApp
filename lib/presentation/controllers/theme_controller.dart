import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/storage/storage_service.dart';

class ThemeController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  final RxBool _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;
  ThemeMode get themeMode =>
      _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    _isDarkMode.value = _storageService.getDarkMode();
  }

  Future<void> toggleTheme() async {
    _isDarkMode.value = !_isDarkMode.value;
    await _storageService.setDarkMode(_isDarkMode.value);
    Get.changeThemeMode(themeMode);
  }

  Future<void> setDarkMode(bool isDark) async {
    _isDarkMode.value = isDark;
    await _storageService.setDarkMode(isDark);
    Get.changeThemeMode(themeMode);
  }

  Future<void> setLightMode() async {
    await setDarkMode(false);
  }

  Future<void> setSystemMode() async {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    await setDarkMode(brightness == Brightness.dark);
  }
}
