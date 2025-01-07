// injection_container.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:weather_clean_architecture/features/weather/data/data_sources/weather_api_service.dart';
import 'features/weather/data/repositories/weather_repository_impl.dart';
import 'features/weather/domain/repositories/weather_repository.dart';
import 'features/weather/domain/usecases/get_weather.dart';
import 'features/weather/presentation/bloc/weather_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // External
  sl.registerLazySingleton(() => Dio());

  // Data Sources
  sl.registerSingleton<WeatherApiService>(WeatherApiService(sl()));

  // Repositories
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetWeather(sl()));

  // Cubit
  sl.registerFactory(() => WeatherCubit(sl()));
}
