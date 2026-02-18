import 'package:dimbalima_app/core/config/app_config.dart';
import 'package:dio/dio.dart';
import 'auth_interceptor.dart';

class DioClient {
  static final Dio dio = Dio(BaseOptions(
    baseUrl: AppConfig.apiBaseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  )
  )..interceptors.add(AuthInterceptor());
}