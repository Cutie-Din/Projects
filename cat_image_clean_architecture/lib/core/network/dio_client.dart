import 'package:dio/dio.dart';
import 'interceptors/logger_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.thecatapi.com/v1', // Thay bằng URL của bạn
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Thêm các Interceptor từ tệp khác
    _dio.interceptors.addAll([
      LoggerInterceptor(),
      HeaderInterceptor(),
      RetryInterceptor(dio: _dio, retries: 3),
    ]);
  }

  Dio get dio => _dio;
}
