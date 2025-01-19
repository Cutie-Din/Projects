import 'package:dartz/dartz.dart';
import 'package:movie_clean_architecture/core/network/dio_client.dart';
import 'package:movie_clean_architecture/domain/auth/entities/sign_in.dart';

import '../entities/sign_up.dart';

abstract class AuthRepository {
  Future<Either<DioClient, SignUp>> postSignUp(String email, String password);
  Future<Either<DioClient, SignIn>> postSignIn(String email, String password);
}
