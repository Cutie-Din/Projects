abstract class Failure {
  final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure([super.message = "Không kết nối Internet."]);
}

class TimeoutFailure extends Failure {
  TimeoutFailure([super.message = "Yêu cầu quá hạn."]);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = "Lỗi Server"]);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = "Lỗi truy cập Cache"]);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure([super.message = "Đã có lỗi xảy ra."]);
}
