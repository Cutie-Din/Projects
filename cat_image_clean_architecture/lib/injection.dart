import 'package:cat_image_clean_architecture/data/data_source/cat_image_service.dart';
import 'package:cat_image_clean_architecture/data/repository/cat_image_repository_impl.dart';
import 'package:cat_image_clean_architecture/domain/repository/cat_image_repository.dart';
import 'package:cat_image_clean_architecture/domain/usecase/get_cat_image.dart';
import 'package:cat_image_clean_architecture/presentation/cubit/cat_image_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Network
  sl.registerLazySingleton(() => Dio());

  // Data Source
  sl.registerSingleton<CatImageService>(CatImageService(sl()));

  // Repository
  sl.registerSingleton<CatImageRepository>(CatImageRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<GetCatImage>(GetCatImage(sl()));

  // Cubit
  sl.registerSingleton<CatImageCubit>(CatImageCubit(sl()));
}
