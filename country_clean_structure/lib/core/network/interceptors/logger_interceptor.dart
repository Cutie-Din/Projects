import 'package:dio/dio.dart';

import '../dio_client.dart';

class LoggerInterceptor extends Interceptor {
  final DioClient dioClient;

  LoggerInterceptor({required this.dioClient}); // Inject DioClient into the interceptor

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('🚀 [Yêu cầu] ${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    print('Body: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('✅ [Phản hồi] ${response.statusCode} ${response.requestOptions.uri}');
    print('Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Capture the error message and set it in DioClient
    final errorMessage = '❌ [Lỗi] ${err.type} ${err.message}';
    dioClient.setErrorMessage(errorMessage); // Set error message in DioClient
    print(errorMessage);
    super.onError(err, handler);
  }
}
