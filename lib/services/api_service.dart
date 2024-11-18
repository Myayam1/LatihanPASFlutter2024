import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_pas_flutter_terbaru_2024/models/country_model.dart';

class ApiService {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<CountryModel>> fetchCountries() async {
    final response = await http.get(Uri.parse("$baseUrl//api/v1/json/3/all_countries.php"));

    if (response.statusCode == 200) {
      List data = json.decode(response.body)["countries"];
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}