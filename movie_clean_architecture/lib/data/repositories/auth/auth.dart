import 'package:dartz/dartz.dart';
import 'package:movie_clean_architecture/core/network/dio_client.dart';
import 'package:movie_clean_architecture/domain/auth/entities/sign_in.dart';
import 'package:movie_clean_architecture/domain/auth/entities/sign_up.dart';
import 'package:movie_clean_architecture/domain/auth/repositories/auth.dart';

import '../../../services_locator.dart';
import '../../sources/api_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<Either<DioClient, SignUp>> postSignUp(String email, String password) async {
    try {
      final signupModel = await apiService.signup(email, password);

      final signUpEntity = signupModel.toSignUp();

      return Right(signUpEntity);
    } catch (e) {
      return Left(sl<DioClient>());
    }
  }

  @override
  Future<Either<DioClient, SignIn>> postSignIn(String email, String password) async {
    try {
      final signinModel = await apiService.signin(email, password);

      final signinEntity = signinModel.toSignIn();

      return Right(signinEntity);
    } catch (e) {
      return Left(sl<DioClient>());
    }
  }
}
