import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:user_clean_structure/data/data_source/user_api_service.dart';
import 'package:user_clean_structure/data/repository/user_repository_impl.dart';
import 'package:user_clean_structure/domain/repository/user_repository.dart';
import 'package:user_clean_structure/domain/usecase/get_user.dart';
import 'package:user_clean_structure/presentation/cubit/user_cubit.dart';

import 'core/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network - Register Dio
  sl.registerLazySingleton(() => Dio());

  // DioClient - Register with injected Dio
  sl.registerLazySingleton(() => DioClient(sl()));

  // UserApiService - Use DioClient for the API service
  sl.registerSingleton<UserApiService>(
    UserApiService(sl<DioClient>().dio),
  );

  // Repository
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<GetUser>(GetUser(sl()));

  // Cubit - Register UserCubit with DioClient as a parameter
  sl.registerSingleton<UserCubit>(UserCubit(sl(), sl()));
}
