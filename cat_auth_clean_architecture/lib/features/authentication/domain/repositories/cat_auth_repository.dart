import 'package:cat_auth_clean_architecture/core/error/failures.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signin.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signup.dart';
import 'package:dartz/dartz.dart';

abstract class CatAuthRepository {
  // Sign In
  Future<Either<Failure, CatSignIn>> postCatSignIn(String email, String password);

  // Sign Up
  Future<Either<Failure, CatSignUp>> postCatSignUp(String email, String username, String password);
}
