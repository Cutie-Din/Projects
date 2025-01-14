import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'data/data_source/country_api_service.dart';
import 'data/repository/country_repository_impl.dart';
import 'domain/repository/country_repository.dart';
import 'domain/usecase/get_country.dart';
import 'presentation/cubit/country_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network - Register Dio
  sl.registerLazySingleton(() => Dio());

  // DioClient - Register with injected Dio
  sl.registerLazySingleton(() => DioClient(sl()));

  // CountryApiService - Use DioClient for the API service
  sl.registerSingleton<CountryApiService>(
    CountryApiService(sl<DioClient>().dio),
  );

  // Repository
  sl.registerSingleton<CountryRepository>(CountryRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<GetCountry>(GetCountry(sl()));

  // Cubit - Register CountryCubit with DioClient as a parameter
  sl.registerSingleton<CountryCubit>(CountryCubit(sl(), sl()));
}
