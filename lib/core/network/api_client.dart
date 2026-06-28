import 'dart:convert';
import 'package:http/http.dart' as http;
import '../error/api_error.dart';

class ApiClient {
  final http.Client _client = http.Client();

  Future<dynamic> get(String url) async {
    try {
      final response = await _client.get(Uri.parse(url)).timeout(
            const Duration(seconds: 15),
          );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        throw ApiError(
          type: ApiErrorType.api,
          message: 'Server error: ${response.statusCode}',
          code: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError(
        type: ApiErrorType.network,
        message: 'Network error or timeout: $e',
      );
    }
  }
}
