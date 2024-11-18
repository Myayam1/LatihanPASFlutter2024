import 'package:belajar_pas_flutter_terbaru_2024/controllers/country_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/controllers/database_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/controllers/login_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/controllers/navigation_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/controllers/registration_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/controllers/responsive_controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<RegistrationController>(RegistrationController());
    Get.put<ResponsiveController>(ResponsiveController());
    Get.put<NavigationController>(NavigationController());
    Get.put<DatabaseController>(DatabaseController());
    Get.put<CountryController>(CountryController());
  }
}