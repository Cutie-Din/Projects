import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_clean_structure/core/utils/constants.dart';
import 'package:user_clean_structure/data/model/user_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @GET('/users')
  Future<List<UserModel>> getUsers({
    @Query('since') required int since,
    @Query('per_page') required int perPage,
  });
}
