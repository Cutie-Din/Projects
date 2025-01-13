import 'package:cat_image_clean_architecture/core/error/failures.dart';
import 'package:cat_image_clean_architecture/domain/entity/cat_image.dart';
import 'package:dartz/dartz.dart';

abstract class CatImageRepository {
  Future<Either<Failure, List<CatImage>>> getCatImages();
}
