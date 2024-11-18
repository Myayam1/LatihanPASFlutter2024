import 'package:belajar_pas_flutter_terbaru_2024/controllers/country_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/country_model.dart';

class DatabaseController extends GetxController {
  static Database? _db;
  var savedCountries = <CountryModel>[].obs;
  final CountryController countryController = Get.put(CountryController());

  // Make sure to handle null properly by returning a Future<Database?> type
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'country_database.db');

    // Open the database
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE countries(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name_en TEXT,
            flag_url_32 TEXT
          )
        ''');
      },
    );
  }

  // Ensure that dbClient is not null before performing operations
  Future<int> saveCountry(CountryModel country) async {
    var dbClient = await db;  // dbClient might still be null here
    if (dbClient == null) {
      throw Exception("Database is not initialized");
    }

    int result = await dbClient.insert('countries', country.toMap());
    loadSavedCountries();
    return result;
  }

  // Load saved countries from the database
  Future<void> loadSavedCountries() async {
    var dbClient = await db;
    if (dbClient == null) {
      throw Exception("Database is not initialized");
    }

    List<Map<String, dynamic>> queryResult = await dbClient.query('countries');
    savedCountries.assignAll(queryResult.map((data) => CountryModel.fromJson(data)));

    savedCountries.forEach((country) => country.isSaved.value = true);

    Set<String> savedCountryNames = savedCountries.map((country) => country.name).toSet();

    for (var country in countryController.countriesList) {
      country.isSaved.value = savedCountryNames.contains(country.name);
    }
  }

  // Delete saved country from the database
  Future<int> deleteSavedCountries(CountryModel country) async {
    var dbClient = await db;
    if (dbClient == null) {
      throw Exception("Database is not initialized");
    }

    int result = await dbClient.delete(
        'countries',
        where: 'name_en = ?',
        whereArgs: [country.name]
    );
    loadSavedCountries();
    return result;
  }
}
