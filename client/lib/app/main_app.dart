import 'package:Lumeo/app/config/app_config.dart';
import 'package:Lumeo/app/config/app_dependency.dart';
import 'package:Lumeo/app/config/app_pages.dart';
import 'package:Lumeo/app/config/app_routes.dart';
import 'package:Lumeo/app/config/color_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: AppConfig.APP_TITLE,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('ko', 'KR'),

        // Theme
        theme: ThemeData(
          colorScheme: ColorSystem.colorScheme,
          scaffoldBackgroundColor: ColorSystem.white,
        ),
        initialRoute: AppRoutes.HOME,
        initialBinding: AppDependency(),

        // Routes
        getPages: AppPages.images);
  }
}
