import 'package:cat_image_clean_architecture/data/model/cat_image_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/utils/constants.dart';

part 'cat_image_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class CatImageService {
  factory CatImageService(Dio dio, {String? baseUrl}) = _CatImageService;

  @GET('/images/search')
  Future<List<CatImageModel>> getCatImages(@Query('limit') int limit);
}
