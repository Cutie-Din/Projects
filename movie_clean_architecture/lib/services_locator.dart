import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_clean_architecture/common/cubit/post_data_cubit.dart';
import 'package:movie_clean_architecture/core/network/dio_client.dart';
import 'package:movie_clean_architecture/data/repositories/auth/auth.dart';
import 'package:movie_clean_architecture/data/sources/api_service.dart';
import 'package:movie_clean_architecture/domain/auth/repositories/auth.dart';
import 'package:movie_clean_architecture/domain/auth/usecases/post_auth.dart';
import 'package:movie_clean_architecture/presentation/cubit/splash/splash_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network - Register Dio
  sl.registerLazySingleton(() => Dio());

  // DioClient - Register with injected Dio
  sl.registerLazySingleton(() => DioClient(sl()));

  // ApiService
  sl.registerSingleton<ApiService>(ApiService(sl<DioClient>().dio));

  // Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<PostAuth>(PostAuth(sl()));

  // Cubit
  sl.registerSingleton<SplashCubit>(SplashCubit());

  sl.registerSingleton<PostCubit>(PostCubit(sl(), sl()));
}
