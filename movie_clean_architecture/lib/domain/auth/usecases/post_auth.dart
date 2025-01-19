import 'package:dartz/dartz.dart';
import 'package:movie_clean_architecture/core/network/dio_client.dart';
import 'package:movie_clean_architecture/data/sources/api_service.dart';
import 'package:movie_clean_architecture/domain/auth/entities/sign_in.dart';
import 'package:movie_clean_architecture/domain/auth/entities/sign_up.dart';
import 'package:movie_clean_architecture/domain/auth/repositories/auth.dart';

class PostAuth {
  final AuthRepository repository;
  PostAuth(this.repository);

  Future<Either<DioClient, SignUp>> postSignUp(String email, String password) async {
    return await repository.postSignUp(email, password);
  }

  Future<Either<DioClient, SignIn>> postSignIn(String email, String password) async {
    return await repository.postSignIn(email, password);
  }
}
