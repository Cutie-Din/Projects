import 'package:dartz/dartz.dart';
import 'package:user_clean_structure/core/network/dio_client.dart';
import 'package:user_clean_structure/domain/entity/user.dart';

abstract class UserRepository {
  Future<Either<DioClient, List<User>>> getUsers({required int since, required int perPage});
}
