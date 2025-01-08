import 'package:cat_facts_clean_architecture/features/cat_facts/data/models/cat_facts_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/constants.dart';

part 'cat_facts_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class CatFactsApiService {
  factory CatFactsApiService(Dio dio, {String baseUrl}) = _CatFactsApiService;

  @GET('/')
  Future<CatFactsModel> getCatFacts();
}
