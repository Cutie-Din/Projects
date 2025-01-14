import 'package:country_clean_structure/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<DioClient, Type>> call(Params params);
}
