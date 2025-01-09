import 'package:cat_auth_clean_architecture/features/authentication/data/data_sources/cat_auth_api_service.dart';
import 'package:cat_auth_clean_architecture/features/authentication/data/repositories/cat_auth_repository_imp.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/repositories/cat_auth_repository.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/usecases/post_cat_auth.dart';
import 'package:cat_auth_clean_architecture/features/authentication/presentation/signin/cubit/cat_signin_cubit.dart';
import 'package:cat_auth_clean_architecture/features/authentication/presentation/signup/cubit/cat_signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final i = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network
  i.registerLazySingleton(() => Dio());

  // Data Sources
  i.registerSingleton<CatAuthApiService>(CatAuthApiService(i()));

  // Repositories
  i.registerSingleton<CatAuthRepository>(CatAuthRepositoryImp(i()));

  // Usecases
  i.registerSingleton<PostCatAuth>(PostCatAuth(i()));

  // Cubit
  i.registerSingleton<CatSignInCubit>(CatSignInCubit(i()));
  i.registerSingleton<CatSignUpCubit>(CatSignUpCubit(i()));
}
