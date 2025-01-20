import 'package:dio/dio.dart';

import '../model/cat.dart';
import '../../core/utils/constants.dart';

class CatFactApiServiceManual {
  final Dio _dio;

  CatFactApiServiceManual(this._dio);

  Future<Cat> getCatFact() async {
    try {
      final response = await _dio.get(AppConstants.baseURL);

      if (response.statusCode == 200) {
        return Cat.fromJson(response.data);
      } else {
        throw Exception(
          "Failed to fetch cat fact. HTTP Status: ${response.statusCode} - ${response.statusMessage}",
        );
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        throw Exception(
          "DioError: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}",
        );
      } else {
        throw Exception("DioError: ${dioError.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
