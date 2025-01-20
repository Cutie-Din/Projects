part of 'cat_image_cubit.dart';

abstract class CatImageState {}

class CatImageInitial extends CatImageState {}

class CatImageLoading extends CatImageState {}

class CatImageLoaded extends CatImageState {
  final List<CatImage> catImages;
  CatImageLoaded(this.catImages);
}

class CatImageError extends CatImageState {
  final DioClient dio;
  CatImageError(this.dio);
}
