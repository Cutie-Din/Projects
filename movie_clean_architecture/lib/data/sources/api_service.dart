import 'package:dio/dio.dart';
import 'package:movie_clean_architecture/data/models/auth/sign_in_model.dart';
import 'package:movie_clean_architecture/data/models/auth/sign_up_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/utils/constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  // Sign Ip - Sign In - Logout API
  @POST(AppConstants.signup)
  Future<SignUpModel> signup(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST(AppConstants.signin)
  Future<SignInModel> signin(
    @Field('email') String email,
    @Field('password') String password,
  );
}
