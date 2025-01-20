import 'package:cat_image_clean_architecture/core/network/dio_client.dart';
import 'package:cat_image_clean_architecture/domain/entity/cat_image.dart';
import 'package:dartz/dartz.dart';

abstract class CatImageRepository {
  Future<Either<DioClient, List<CatImage>>> getCatImages();
}
