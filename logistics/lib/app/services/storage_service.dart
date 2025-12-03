import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logistics/app/services/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  static const String _emailKey = 'user_email';
  static const String _passwordKey = 'user_password';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  static const String _keyToken = 'auth_token';

  Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(key: _keyToken, value: token);
      logger.i('Token saved successfully');
    } catch (e) {
      // Handle error if needed
      logger.e('Error saving token: $e');
      rethrow;
    }
  }

  Future<String?> getToken() async {
    try {
      return await _secureStorage.read(key: _keyToken);
    } catch (e) {
      logger.e('Error reading token: $e');
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> clearAll() async {
    try {
      await _secureStorage.deleteAll();
      logger.i('All data secure storage cleared successfully');
    } catch (e) {
      logger.e('Error clearing data: $e');
      rethrow;
    }
  }

  Future<void> saveUserCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_passwordKey, password);
  }

  Future<Map<String, String?>> getUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString(_emailKey),
      'password': prefs.getString(_passwordKey),
    };
  }
}
