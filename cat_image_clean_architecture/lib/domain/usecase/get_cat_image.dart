import 'package:cat_image_clean_architecture/core/network/dio_client.dart';
import 'package:cat_image_clean_architecture/domain/entity/cat_image.dart';
import 'package:cat_image_clean_architecture/domain/repository/cat_image_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatImage {
  final CatImageRepository repository;
  GetCatImage(this.repository);

  Future<Either<DioClient, List<CatImage>>> call() async {
    return await repository.getCatImages();
  }
}
