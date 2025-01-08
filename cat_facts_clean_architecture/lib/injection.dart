import 'package:cat_facts_clean_architecture/features/cat_facts/data/data_sources/cat_facts_api_service.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/data/data_sources/cat_facts_api_service_old.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/data/repositories/cat_facts_repository_imp.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/repositories/cat_facts_repository.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/usecases/get_cat_facts.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/presentation/cubit/cat_facts_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network
  sl.registerLazySingleton(() => Dio());

  // Data Sources
  sl.registerSingleton<CatFactsApiService>(CatFactsApiService(sl()));
  // sl.registerSingleton<CatFactsApiServiceOld>(CatFactsApiServiceOld(sl()));

  // Repositories
  sl.registerSingleton<CatFactsRepository>(CatFactsRepositoryImp(sl()));

  // Usecases
  sl.registerSingleton<GetCatFacts>(GetCatFacts(sl()));

  // Cubit
  sl.registerSingleton<CatFactsCubit>(CatFactsCubit(sl()));
}
