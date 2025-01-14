import 'package:country_clean_structure/data/data_source/country_api_service.dart';
import 'package:dio/dio.dart';
import 'interceptors/logger_interceptor.dart';

class DioClient {
  final Dio _dio;
  String? errorMessage; // Field to store the error message

  DioClient(this._dio) {
    _dio
      ..options = BaseOptions(
        baseUrl: 'https://restcountries.com/v3.1',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
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
