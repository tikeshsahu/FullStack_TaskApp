import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;
  ThemeMode get themeMode =>
      _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(themeMode);
  }

  void setDarkMode(bool isDark) {
    _isDarkMode.value = isDark;
    Get.changeThemeMode(themeMode);
  }

  void setLightMode() {
    setDarkMode(false);
  }
}
