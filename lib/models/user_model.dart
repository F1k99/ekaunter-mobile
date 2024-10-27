// models/user_model.dart
class UserModel {
  final int userId;
  final String name;
  final String username;
  final String email;
  final String role;
  final String status;
  final String token;

  UserModel({
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.status,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['userData'];
    return UserModel(
      userId: userData['usr_id'] ?? 0,
      name: userData['name'] ?? '',
      username: userData['username'] ?? '',
      email: userData['email'] ?? '',
      role: userData['role'] ?? '',
      status: userData['status'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
