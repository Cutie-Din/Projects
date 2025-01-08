import 'package:cat_facts_clean_architecture/core/error/failures.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/entities/cat_facts.dart';
import 'package:dartz/dartz.dart';

abstract class CatFactsRepository {
  Future<Either<Failure, CatFacts>> getCatFacts();
}
