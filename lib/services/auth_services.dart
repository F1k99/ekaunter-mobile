import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../api_config.dart';

class AuthServices {
  Future<LoginResponse?> login(String email, String password) async {
    final uri = Uri.parse(ApiConfig.login);
    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200 && response.headers['content-type']?.contains('application/json') == true) {
      final jsonResponse = json.decode(response.body);
      final loginResponse = LoginResponse.fromJson(jsonResponse);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', loginResponse.token);

      return loginResponse;
    } else if (response.statusCode != 200) {
      try {
        final errorResponse = json.decode(response.body);
        throw Exception(errorResponse['message'] ?? 'Unknown error');
      } catch (_) {
        throw Exception('Unexpected error: ${response.statusCode}');
      }
    } else {
      throw Exception('Unexpected response format.');
    }
  }
}
