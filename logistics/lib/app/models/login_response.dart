class LoginResponse {
  final String token;

  LoginResponse({required this.token});

  factory LoginResponse.fromJson(dynamic json) {
    if (json is String) {
      return LoginResponse(token: json);
    } else {
      throw Exception('Invalid JSON format for LoginResponse');
    }
  }
}