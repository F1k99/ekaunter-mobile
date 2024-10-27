class LoginResponse {
  final String message;
  final UserData userData;
  final String token;

  LoginResponse({
    required this.message,
    required this.userData,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      userData: UserData.fromJson(json['data']['userData']),
      token: json['data']['token'],
    );
  }
}

class UserData {
  final int usrId;
  final String name;
  final String username;
  final String email;
  final String role;
  final String status;
  final String avatar;

  UserData({
    required this.usrId,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.status,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      usrId: json['usr_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
      status: json['status'],
      avatar: json['avatar'] ?? '',
    );
  }
}
