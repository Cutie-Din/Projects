import 'package:country_clean_structure/data/model/country_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/utils/constants.dart';

part 'country_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class CountryApiService {
  factory CountryApiService(Dio dio, {String baseUrl}) = _CountryApiService;

  @GET("/all")
  Future<List<CountryModel>> getCountries({
    @Query('fields') String fields = 'name,flags', // Specify the fields to fetch
  });
}
