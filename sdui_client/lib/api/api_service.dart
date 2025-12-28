import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Android Emulator → 10.0.2.2 maps to localhost
  // iOS Simulator / Web → use localhost
  static const String baseUrl = "http://10.0.2.2:8080";

  static Future<Map<String, dynamic>> fetchScreen(String screen) async {
    final uri = Uri.parse('$baseUrl/screens/$screen');

    final response = await http.post(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception(
        "Failed to load screen: ${response.statusCode}",
      );
    }
  }
}
