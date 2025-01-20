import 'package:dartz/dartz.dart';
import 'package:test_thing/core/network/dio_client.dart';

import '../entity/cat_fact.dart';

abstract class CatFactRepository {
  Future<Either<DioClient, CatFact>> getCatFact();
}
