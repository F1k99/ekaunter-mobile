import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../api_config.dart';

class AuthService {
  Future<UserModel> login({required String email, required String password}) async {
    final url = Uri.parse(ApiConfig.baseUrl + ApiConfig.login);
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({'email': email, 'password': password});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final user = UserModel.fromJson(data);
      await _storeToken(user.token);
      return user;
    } else {
      final errorData = jsonDecode(response.body);
      final errorMessage = errorData['message'] ?? 'Unknown error';
      throw Exception('Error ${response.statusCode}: $errorMessage');
    }
  }

  Future<void> _storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
