import 'package:belajar_pas_flutter_terbaru_2024/controllers/responsive_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/mobile_pages/nav_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveManager extends StatelessWidget {
  const ResponsiveManager({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveController controller = Get.find();
    return Obx(() {
      if (controller.isMobile()) {
        return MobileNavContainer();
      } else if (controller.isTablet()) {
        return Placeholder();
      } else {
        throw Exception("fucking idiot.");
      }
    });
  }
}
