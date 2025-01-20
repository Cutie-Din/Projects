import 'package:dio/dio.dart';

import '../../core/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../model/cat.dart';

part 'cat_fact_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class CatFactApiService {
  factory CatFactApiService(Dio dio, {String baseUrl}) = _CatFactApiService;

  @GET('/')
  Future<Cat> getCatFact();
}
