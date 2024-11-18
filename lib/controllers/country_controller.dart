import 'package:belajar_pas_flutter_terbaru_2024/models/country_model.dart';
import 'package:belajar_pas_flutter_terbaru_2024/services/api_service.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  var isLoading = true.obs;
  var countriesList = <CountryModel>[].obs;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  void fetchCountries() async {
    try {
      isLoading(true);
      var countries = await ApiService().fetchCountries();
      countriesList.assignAll(countries);
    } finally {
      isLoading(false);
    }
  }
}