import 'package:belajar_pas_flutter_terbaru_2024/controllers/database_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleCard extends StatelessWidget {
  final CountryModel model;
  const SimpleCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final DatabaseController controller = Get.find();
    return Obx(() {
      return Card(
        margin: EdgeInsets.all(16.0),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Image on the far left
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  model.flag_url,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),

              // Text next to the image
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    model.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Like button (star icon) on the far right
              IconButton(
                icon: Icon(
                  model.isSaved.value ? Icons.star : Icons.star_border_outlined,
                  color: Colors.amber,
                ),
                onPressed: () {
                  if (model.isSaved.value) {
                    model.isSaved.value = false;
                    controller.deleteSavedCountries(model);
                  } else {
                    model.isSaved.value = true;
                    controller.saveCountry(model);
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
