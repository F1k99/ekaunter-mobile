import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  bool _isLoading = false;
  String? _error;
  int? _errorCode;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int? get errorCode => _errorCode;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    _errorCode = null;
    notifyListeners();

    try {
      _user = await _authService.login(email: email, password: password);
      if (_user == null) {
        _error = 'Login failed';
      }
    } catch (e) {
      final errorParts = e.toString().split(':');
      _errorCode = int.tryParse(errorParts[0].split(' ').last) ?? 0;
      _error = errorParts.sublist(1).join(':').trim();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    await _authService.logout();
    notifyListeners();
  }

  Future<bool> checkAuthStatus() async {
    final token = await _authService.getToken();
    return token != null;
  }
}
