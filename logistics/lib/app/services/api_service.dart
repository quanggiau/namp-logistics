import 'dart:convert';

import 'package:logistics/app/constants/string_constants.dart';
import 'package:logistics/app/models/api_response.dart';
import 'package:logistics/app/services/logger.dart';
import 'package:logistics/app/services/storage_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final StorageService _storageService = StorageService();

  Future<Map<String, String>> _getHeaders({bool includeToken = false}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (includeToken) {
      final token = await _storageService.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  /// Generate GET request
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = Uri.parse(
        '${APIConfig.baseUrl}$endpoint',
      ).replace(queryParameters: queryParameters);
      logger.i('GET Request to: $uri');

      final headers = await _getHeaders(includeToken: requiresAuth);
      final response = await http.get(uri, headers: headers);

      logger.i('Response Status: ${response.statusCode}');
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      logger.e('GET Request Error: $e');
      rethrow;
    }
  }

  /// Generic POST request
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = false,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = Uri.parse('${APIConfig.baseUrl}$endpoint');

      logger.i('POST Request: $uri');
      logger.i('POST Body: ${jsonEncode(body)}');

      final headers = await _getHeaders(includeToken: requiresAuth);
      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      logger.i('POST Response [${response.statusCode}]: ${response.body}');

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      logger.e('POST Error: $e');
      rethrow;
    }
  }

  // Handle response
  ApiResponse<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic)? fromJson,
  ) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      return ApiResponse<T>.fromJson(jsonResponse, fromJson);
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'Request failed with status: ${response.statusCode}',
      );
    }
  }
}

// Custom API Exception
class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException({required this.statusCode, required this.message});

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}
