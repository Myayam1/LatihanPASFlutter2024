import 'package:belajar_pas_flutter_terbaru_2024/bindings/bindings.dart';
import 'package:belajar_pas_flutter_terbaru_2024/controllers/responsive_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/login_responsive_manager.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/responsive_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveController respController = Get.put(ResponsiveController());

    return GetMaterialApp(
      initialRoute: '/login',
      initialBinding: MyBindings(),
      getPages: [
        GetPage(name: '/login', page: () => LayoutBuilder(builder: (context, constraints) {
          respController.updateScreenWidth(constraints.maxWidth);
          return LoginResponsiveManager();
        })),
        GetPage(name: '/dashboard', page: () => LayoutBuilder(builder: (context, constraints) {
          respController.updateScreenWidth(constraints.maxWidth);
          return ResponsiveManager();
        }))
      ],
    );
  }
}