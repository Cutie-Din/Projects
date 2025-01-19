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
    // Check if the error has a response (i.e., the server responded with an error)
    if (err.response != null) {
      final statusCode = err.response?.statusCode;
      final responseData = err.response?.data;

      // Check if the response data contains the 'message' key
      String message = '';
      if (responseData is Map<String, dynamic>) {
        message = responseData['message'] ?? 'No message available';
      } else {
        message = 'Invalid response format';
      }

      // Capture the error message from the server
      final errorMessage = '$message';
      dioClient.setErrorMessage(errorMessage); // Set error message in DioClient
      print(errorMessage);
    } else {
      // If no response is available (network error, timeout, etc.)
      final errorMessage = '❌ [Lỗi] ${err.type} ${err.message}';
      dioClient.setErrorMessage(errorMessage); // Set error message in DioClient
      print(errorMessage);
    }

    super.onError(err, handler);
  }
}
