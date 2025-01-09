import 'package:cat_auth_clean_architecture/core/error/failures.dart';
import 'package:cat_auth_clean_architecture/features/authentication/data/data_sources/cat_auth_api_service.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signin.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signup.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/repositories/cat_auth_repository.dart';
import 'package:dartz/dartz.dart';

class CatAuthRepositoryImp implements CatAuthRepository {
  final CatAuthApiService catAuthApiService;
  CatAuthRepositoryImp(this.catAuthApiService);

  @override
  Future<Either<Failure, CatSignIn>> postCatSignIn(String email, String password) async {
    try {
      print('Repository: $email, $password');
      final signin = await catAuthApiService.postCatSignIn(email, password);
      return Right(signin);
    } catch (e) {
      print('Error: $e');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CatSignUp>> postCatSignUp(
      String email, String username, String password) async {
    try {
      final signup = await catAuthApiService.postCatSignUp(email, username, password);
      return Right(signup);
    } catch (e) {
      print('Error: $e');
      return Left(ServerFailure());
    }
  }
}
