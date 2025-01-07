// lib/features/weather/data/repositories/weather_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture/core/error/failures.dart';
import 'package:weather_clean_architecture/core/utils/constants.dart';
import 'package:weather_clean_architecture/features/weather/domain/entities/weather.dart';
import 'package:weather_clean_architecture/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_clean_architecture/features/weather/data/data_sources/weather_api_service.dart';
import '../../../../core/network/dio_client.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, WeatherEntity>> getWeather(String cityName) async {
    try {
      final weather = await apiService.getWeather(cityName, AppConstants.apiKey);
      return Right(weather);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
