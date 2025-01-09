class DioException implements Exception {
  final String message;

  DioException([this.message = "Đã có lỗi xảy ra."]);

  @override
  String toString() => message;
}

class NetworkException extends DioException {
  NetworkException([String message = "Không kết nối Internet."]) : super(message);
}

class TimeoutException extends DioException {
  TimeoutException([String message = "Yêu cầu quá hạn."]) : super(message);
}

class ServerException extends DioException {
  ServerException([String message = "Lỗi Server."]) : super(message);
}

class CacheException extends DioException {
  CacheException([String message = "Lỗi truy cập Cache."]) : super(message);
}
