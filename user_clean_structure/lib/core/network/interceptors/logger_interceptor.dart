import 'package:dio/dio.dart';

import '../dio_client.dart';

class LoggerInterceptor extends Interceptor {
  final DioClient dioClient;

  LoggerInterceptor({required this.dioClient}); // Inject DioClient into the interceptor

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('🚀 [Yêu cầu] ${options.method} ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('✅ [Phản hồi] ${response.statusCode} ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = '❌ [Lỗi] ${err.type}';

    if (err.response != null) {
      final statusCode = err.response?.statusCode;
      final responseData = err.response?.data;
      errorMessage += '\n📋 [Chi tiết lỗi]: StatusCode: $statusCode, Data: $responseData';
    } else {
      errorMessage += '\n📋 [Chi tiết lỗi]: Không có phản hồi từ server.';
    }

    dioClient.setErrorMessage(errorMessage); // Lưu error message vào DioClient
    print(errorMessage);

    super.onError(err, handler);
  }
}
