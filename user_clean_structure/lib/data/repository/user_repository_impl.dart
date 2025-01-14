import 'package:dartz/dartz.dart';
import 'package:user_clean_structure/core/network/dio_client.dart';
import 'package:user_clean_structure/data/data_source/user_api_service.dart';
import 'package:user_clean_structure/domain/entity/user.dart';
import 'package:user_clean_structure/domain/repository/user_repository.dart';

import '../../injection.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService apiService;
  UserRepositoryImpl(this.apiService);

  @override
  Future<Either<DioClient, List<User>>> getUsers({required int since, required int perPage}) async {
    try {
      final response = await apiService.getUsers(since: since, perPage: perPage);
      final users = response.map((model) => model.toEntity()).toList();
      return Right(users);
    } catch (e) {
      return Left(sl<DioClient>());
    }
  }
}
