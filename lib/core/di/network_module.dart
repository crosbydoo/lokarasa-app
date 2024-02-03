import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/constant/app_constant.dart';
import 'package:restaurant_app/core/data/remote/interceptors/auth_interceptor.dart';

@module
abstract class NetworkModule {
  @Named('base_url')
  @singleton
  String get baseUrl => AppConstant.appBaseUrl;

  @singleton
  AuthInterceptor get authInterceptor => AuthInterceptor();

  @singleton
  Dio dio(
    @Named('base_url') String baseUrl,
    AuthInterceptor authInterceptor,
  ) {
    var option = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    var dio = Dio(option);
    dio.interceptors.add(authInterceptor);

    return dio;
  }
}
