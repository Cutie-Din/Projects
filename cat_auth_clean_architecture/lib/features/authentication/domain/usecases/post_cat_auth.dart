import 'package:cat_auth_clean_architecture/core/error/failures.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signin.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signup.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/repositories/cat_auth_repository.dart';
import 'package:dartz/dartz.dart';

class PostCatAuth {
  final CatAuthRepository repository;

  PostCatAuth(this.repository);

  Future<Either<Failure, CatSignIn>> postCatSignIn(String email, String password) async {
    print('UseCase: $email, $password');
    return await repository.postCatSignIn(email, password);
  }

  Future<Either<Failure, CatSignUp>> postCatSignUp(
      String email, String username, String password) async {
    return await repository.postCatSignUp(email, username, password);
  }
}
