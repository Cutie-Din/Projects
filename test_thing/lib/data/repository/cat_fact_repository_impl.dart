import 'package:dartz/dartz.dart';
import 'package:test_thing/core/network/dio_client.dart';
import 'package:test_thing/data/model/cat.dart';
import 'package:test_thing/data/source/cat_fact_api_service.dart';
import 'package:test_thing/data/source/cat_fact_api_service_manual.dart';
import 'package:test_thing/domain/entity/cat_fact.dart';
import 'package:test_thing/domain/repository/cat_fact_repository.dart';

import '../../services_locator.dart';

class CatFactsRepositoryImp implements CatFactRepository {
  // final CatFactApiService catFactsApiService;
  // CatFactsRepositoryImp(this.catFactsApiService);

  final CatFactApiServiceManual catFactsApiService;
  CatFactsRepositoryImp(this.catFactsApiService);

  @override
  Future<Either<DioClient, CatFact>> getCatFact() async {
    try {
      final response = await catFactsApiService.getCatFact();
      final result = response.toCatFact();
      return Right(result);
    } catch (e) {
      return Left(sl<DioClient>());
    }
  }
}
