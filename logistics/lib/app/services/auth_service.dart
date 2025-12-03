import 'package:logistics/app/constants/string_constants.dart';
import 'package:logistics/app/models/api_response.dart';
import 'package:logistics/app/models/login_response.dart';
import 'package:logistics/app/services/api_service.dart';
import 'package:logistics/app/services/logger.dart';
import 'package:logistics/app/services/storage_service.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final ApiService _apiService = ApiService();
  final StorageService _storageService = StorageService();

  Future<void> saveUserCredentials({
    required String email,
    required String password,
  }) async {
    await _storageService.saveUserCredentials(email, password);
  }

  // Login
  Future<ApiResponse<LoginResponse>> login({
    required String email,
    required String password,
    required bool isChecked,
  }) async {
    try {
      final loginRequest = {
        'email': email,
        'password': password,
        "honeypot": null,
        "isChecked": isChecked,
      };

      logger.w(loginRequest);

      final response = await _apiService.post<LoginResponse>(
        APIConfig.apiPathLogin,
        body: loginRequest,
        requiresAuth: false,
        fromJson: (json) => LoginResponse.fromJson(json),
      );

      if (response.isSuccess && response.data != null) {
        // Save token to secure storage
        await _storageService.saveToken(response.data!.token);

        // Save user infor to storage
        await saveUserCredentials(email: email, password: password);

        logger.i('Login successful');
      }

      return response;
    } catch (e) {
      logger.e('Login error: $e');
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _storageService.clearAll();
      logger.i('Logout successful');
    } catch (e) {
      logger.e('Logout error: $e');
      rethrow;
    }
  }

  // Check if logged in
  Future<bool> isLoggedIn() async {
    return await _storageService.isLoggedIn();
  }

  // Get current token
  Future<String?> getCurrentToken() async {
    return await _storageService.getToken();
  }
}
