import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:restaurant_app/core/data/remote/responses/error_response.dart';
import 'package:restaurant_app/core/domain/models/error_dto.dart';
import 'package:restaurant_app/core/domain/models/error_type.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';

FutureOrError<T> callOrError<T>(
  Future<T> Function() block,
) async {
  try {
    return Right(await block());
  } on DioException catch (e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Left(ErrorDto(
          message: 'Connection timeout',
          errorType: ErrorType.connectionTimeout,
          error: e,
        ));
      case DioExceptionType.badResponse:
        var statusCode = e.response?.statusCode ?? 0;
        var message = '';
        try {
          var r = ErrorResponse.fromJson(e.response?.data);
          message = r.message ?? '';
        } catch (e) {
          message = 'Unknown Error';
        }

        switch (statusCode) {
          case 400:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.badRequest,
              error: e,
            ));
          case 401:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.unauthorized,
              error: e,
            ));
          case 404:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.notFound,
              error: e,
            ));
          case 500:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.internalServerError,
              error: e,
            ));
          default:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.unknown,
              error: e,
            ));
        }
      default:
        return Left(ErrorDto(
          message: 'Unknown Error',
        ));
    }
  } on Exception catch (e) {
    return Left(ErrorDto(
      message: e.toString(),
      error: e,
    ));
  } on ArgumentError catch (e) {
    return Left(ErrorDto(
      message: e.message,
    ));
  }
}
