import 'package:dartz/dartz.dart';
import '../error/failures.dart';

/// Lớp cơ sở cho các UseCase.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
