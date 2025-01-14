import 'package:dartz/dartz.dart';
import 'package:user_clean_structure/core/network/dio_client.dart';
import 'package:user_clean_structure/domain/repository/user_repository.dart';

import '../entity/user.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<DioClient, List<User>>> call({
    required int since,
    required int perPage,
  }) async {
    return await repository.getUsers(since: since, perPage: perPage);
  }
}
