import 'package:dartz/dartz.dart';
import 'package:test_thing/core/network/dio_client.dart';

import '../entity/cat_fact.dart';
import '../repository/cat_fact_repository.dart';

class GetCatFact {
  final CatFactRepository repository;

  GetCatFact(this.repository);

  Future<Either<DioClient, CatFact>> getCatFact() async {
    return await repository.getCatFact();
  }
}
