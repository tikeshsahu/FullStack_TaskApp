import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/app_bindings.dart';
import 'routes/app_pages.dart';
import 'themes/app_theme.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,

      // Theme Configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Will be managed by ThemeController later
      // Routing
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,

      // Dependency Injection
      initialBinding: AppBindings(),
    );
  }
}
