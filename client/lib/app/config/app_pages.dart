import 'package:Lumeo/app/config/app_routes.dart';
import 'package:Lumeo/presentation/view/home_screen.dart';
import 'package:Lumeo/presentation/view_model/image_binding.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static List<GetPage> images = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeScreen(),
      binding: ImageBinding(),
    ),
  ];
}
