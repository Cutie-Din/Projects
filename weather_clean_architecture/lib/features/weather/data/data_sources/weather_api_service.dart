// lib/features/weather/data/data_sources/weather_api_service.dart

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_clean_architecture/core/utils/constants.dart';
import 'package:weather_clean_architecture/features/weather/domain/entities/weather.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET('/weather')
  Future<WeatherEntity> getWeather(
    @Query('q') String cityName,
    @Query('appid') String apiKey,
  );
}
