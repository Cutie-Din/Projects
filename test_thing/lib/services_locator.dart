import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_thing/data/repository/cat_fact_repository_impl.dart';
import 'package:test_thing/data/source/cat_fact_api_service.dart';
import 'package:test_thing/domain/repository/cat_fact_repository.dart';
import 'package:test_thing/domain/usecase/get_cat_fact.dart';
import 'package:test_thing/presentation/cubit/test_cubit.dart';

import 'core/network/dio_client.dart';
import 'data/source/cat_fact_api_service_manual.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network - Register Dio
  sl.registerLazySingleton(() => Dio());

  // DioClient - Register with injected Dio
  sl.registerLazySingleton(() => DioClient(sl()));

  // Data Sources
  sl.registerSingleton<CatFactApiService>(CatFactApiService(sl()));
  sl.registerSingleton<CatFactApiServiceManual>(CatFactApiServiceManual(sl()));

  // Repositories
  sl.registerSingleton<CatFactRepository>(CatFactsRepositoryImp(sl()));

  // Usecases
  sl.registerSingleton<GetCatFact>(GetCatFact(sl()));

  // Cubit
  sl.registerSingleton<TestCubit>(TestCubit(sl(), sl()));
}
