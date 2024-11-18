import 'package:belajar_pas_flutter_terbaru_2024/controllers/responsive_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/mobile_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginResponsiveManager extends StatelessWidget {
  const LoginResponsiveManager({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveController controller = Get.find();
    return Obx(() {
      if (controller.isMobile()) {
        return MobileLoginPage();
      } else if (controller.isTablet()) {
        return Placeholder();
      } else {
        throw Exception("fuck you.");
      }
    });
  }
}
