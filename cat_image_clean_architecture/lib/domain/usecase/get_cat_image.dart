import 'package:cat_image_clean_architecture/core/error/failures.dart';
import 'package:cat_image_clean_architecture/domain/entity/cat_image.dart';
import 'package:cat_image_clean_architecture/domain/repository/cat_image_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatImage {
  final CatImageRepository repository;
  GetCatImage(this.repository);

  Future<Either<Failure, List<CatImage>>> call() async {
    return await repository.getCatImages();
  }
}
