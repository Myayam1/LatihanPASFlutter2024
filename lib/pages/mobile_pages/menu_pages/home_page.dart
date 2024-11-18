import 'package:belajar_pas_flutter_terbaru_2024/controllers/country_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/controllers/database_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/widgets/simple_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CountryController controller = Get.find();
    final DatabaseController dbController = Get.find();
    dbController.loadSavedCountries();

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: controller.countriesList.length,
        itemBuilder: (context, index) {
          final country = controller.countriesList[index];
          return SimpleCard(model: country);
        }
      );
    });
  }
}
