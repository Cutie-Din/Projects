class DioException implements Exception {
  final String message;

  DioException([this.message = "Đã có lỗi xảy ra."]);

  @override
  String toString() => message;
}

class NetworkException extends DioException {
  NetworkException([super.message = "Không kết nối Internet."]);
}

class TimeoutException extends DioException {
  TimeoutException([super.message = "Yêu cầu quá hạn."]);
}

class ServerException extends DioException {
  ServerException([super.message = "Lỗi Server."]);
}

class CacheException extends DioException {
  CacheException([super.message = "Lỗi truy cập Cache."]);
}
