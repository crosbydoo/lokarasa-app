import 'package:restaurant_app/core/domain/models/error_type.dart';

class ErrorDto {
  String message;
  String errorCode;
  ErrorType errorType;
  Exception? error;

  ErrorDto({
    required this.message,
    this.errorCode = '-',
    this.errorType = ErrorType.unknown,
    this.error,
  });

  @override
  String toString() {
    return 'ErrorDto{message: $message, errorCode: $errorCode, errorType: $errorType, exception: $error}';
  }
}
