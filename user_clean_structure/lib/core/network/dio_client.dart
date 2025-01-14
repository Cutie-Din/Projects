import 'package:dio/dio.dart';
import 'interceptors/logger_interceptor.dart';

class DioClient {
  final Dio _dio;
  String? errorMessage;

  DioClient(this._dio) {
    _dio
      ..options = BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      )
      ..interceptors.addAll([
        LoggerInterceptor(dioClient: this),
      ]);
  }

  Dio get dio => _dio;

  void setErrorMessage(String message) {
    errorMessage = message;
  }
}
