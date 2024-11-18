import 'package:get/get.dart';

class CountryModel {
 final String name, flag_url;
 RxBool isSaved = false.obs;

  CountryModel({required this.name, required this.flag_url});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(name: json["name_en"], flag_url: json["flag_url_32"]);
  }
  Map<String, dynamic> toMap() {
    return { 'name_en' : name, 'flag_url_32' : flag_url };
  }
}