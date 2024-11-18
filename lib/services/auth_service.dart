import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static String baseUrl = "https://mediadwi.com/api/latihan";

  static Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/login");

    final requestBody = {
      "username" : username,
      "password" : password
    };

    final response = await http.post(
      url,
      body: requestBody
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to log in. Status code: ${response.statusCode}");
    }
  }

  static Future<Map<String, dynamic>> register(String username, String password, String full_name, String email) async {
    final url = Uri.parse("$baseUrl/register-user");

    final requestBody = {
      "username" : username,
      "password" : password,
      "full_name" : full_name,
      "email" : email
    };

    final response = await http.post(
      url,
      body: requestBody
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to register. Status code: ${response.statusCode}");
    }
  }
}