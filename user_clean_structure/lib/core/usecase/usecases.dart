import 'package:dartz/dartz.dart';

import '../network/dio_client.dart';

abstract class UseCase<Type, Params> {
  Future<Either<DioClient, Type>> call(Params params);
}
