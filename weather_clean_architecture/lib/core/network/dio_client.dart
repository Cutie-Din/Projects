import 'package:dio/dio.dart';
import 'package:weather_clean_architecture/core/utils/constants.dart';
import 'package:weather_clean_architecture/features/weather/data/data_sources/weather_api_service.dart';

class DioClient {
  Dio dio;

  DioClient() : dio = Dio() {
    dio.options.baseUrl = AppConstants.baseURL;
    dio.options.connectTimeout = const Duration(seconds: 5); // Sử dụng Duration thay vì int
    dio.options.receiveTimeout = const Duration(seconds: 3); // Sử dụng Duration thay vì int
  }

  WeatherApiService getWeatherApiService() {
    return WeatherApiService(dio);
  }
}
