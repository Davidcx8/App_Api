enum ApiErrorType { network, api, parsing }

class ApiError implements Exception {
  final ApiErrorType type;
  final String message;
  final int? code;

  ApiError({
    required this.type,
    required this.message,
    this.code,
  });

  @override
  String toString() => 'ApiError(type: $type, message: $message, code: $code)';
}
