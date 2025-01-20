import 'package:dio/dio.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/data/models/cat_facts_model.dart';
import '../../../../core/utils/constants.dart';

class CatFactsApiServiceOld {
  final Dio dio;

  CatFactsApiServiceOld(this.dio) {
    dio.options.baseUrl = AppConstants.baseURL;
  }

  Future<CatFactsModel> getCatFacts() async {
    try {
      final response = await dio.get('/');

      if (response.statusCode == 200) {
        return CatFactsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load cat facts: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('DioError: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
