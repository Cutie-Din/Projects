import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeather implements UseCase<WeatherEntity, String> {
  final WeatherRepository repository;

  GetWeather(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(String cityName) {
    return repository.getWeather(cityName);
  }
}
