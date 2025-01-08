import 'exceptions.dart';
import 'failures.dart';

Failure mapEF(Exception exception) {
  if (exception is NetworkException) {
    return NetworkFailure();
  } else if (exception is TimeoutException) {
    return TimeoutFailure();
  } else if (exception is ServerException) {
    return ServerFailure();
  } else if (exception is CacheException) {
    return CacheFailure();
  } else {
    return UnexpectedFailure();
  }
}
