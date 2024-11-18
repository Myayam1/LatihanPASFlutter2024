import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  var screenWdith = 0.0.obs;

  void updateScreenWidth(width) {
    screenWdith.value = width;
  }

  bool isMobile() => screenWdith.value < 600;
  bool isTablet() => screenWdith.value >= 600 && screenWdith < 1200;
}