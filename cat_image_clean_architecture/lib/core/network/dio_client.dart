import 'package:dio/dio.dart';
import '../utils/constants.dart';

class DioClient {
  Dio dio;

  DioClient() : dio = Dio() {
    dio.options.baseUrl = AppConstants.baseURL;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }
}
