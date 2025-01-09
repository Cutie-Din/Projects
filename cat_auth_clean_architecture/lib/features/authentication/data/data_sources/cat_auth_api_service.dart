import 'package:cat_auth_clean_architecture/features/authentication/data/models/cat_signin_model.dart';
import 'package:cat_auth_clean_architecture/features/authentication/data/models/cat_signup_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/constants/api_constants.dart';

part 'cat_auth_api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class CatAuthApiService {
  factory CatAuthApiService(Dio dio, {String baseUrl}) = _CatAuthApiService;

  @POST("/auth/login")
  Future<CatSignInModel> postCatSignIn(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST('/auth/register')
  Future<CatSignUpModel> postCatSignUp(
    @Field('email') String email,
    @Field('username') String username,
    @Field('password') String password,
  );
}
