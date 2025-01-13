import 'package:cat_image_clean_architecture/core/error/exceptions.dart';
import 'package:cat_image_clean_architecture/core/error/failures.dart';
import 'package:cat_image_clean_architecture/data/data_source/cat_image_service.dart';
import 'package:cat_image_clean_architecture/data/model/cat_image_model.dart';
import 'package:cat_image_clean_architecture/domain/entity/cat_image.dart';
import 'package:cat_image_clean_architecture/domain/repository/cat_image_repository.dart';
import 'package:dartz/dartz.dart';

class CatImageRepositoryImpl implements CatImageRepository {
  final CatImageService catImageService;

  CatImageRepositoryImpl(this.catImageService);
  @override
  Future<Either<Failure, List<CatImage>>> getCatImages() async {
    try {
      final response = await catImageService.getCatImages(10);
      final catImages = response.map((model) => CatImage(model.url)).toList();
      return Right(catImages);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
