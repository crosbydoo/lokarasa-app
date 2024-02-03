import 'package:either_dart/either.dart';
import 'package:restaurant_app/core/domain/models/error_dto.dart';

typedef EitherError<T> = Either<ErrorDto, T>;

typedef FutureOrError<T> = Future<EitherError<T>>;
