abstract class Failure {
  final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure([String message = "Không kết nối Internet."]) : super(message);
}

class TimeoutFailure extends Failure {
  TimeoutFailure([String message = "Yêu cầu quá hạn."]) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure([String message = "Lỗi Server"]) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure([String message = "Lỗi truy cập Cache"]) : super(message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure([String message = "Đã có lỗi xảy ra."]) : super(message);
}
