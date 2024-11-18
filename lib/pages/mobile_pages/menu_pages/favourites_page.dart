import 'package:belajar_pas_flutter_terbaru_2024/controllers/database_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/widgets/simple_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileFavouritesPage extends StatelessWidget {
  const MobileFavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controlller = Get.find();

    return Obx(() {
      if (controlller.savedCountries.isEmpty) {
        return Center(child: Text("No favourite country yet."));
      }
      return Scaffold(
        body: ListView.builder(
          itemCount: controlller.savedCountries.length,
          itemBuilder: (context, index) {
            final country = controlller.savedCountries[index];
            return SimpleCard(model: country);
          }
        ),
      );
    });
  }
}
