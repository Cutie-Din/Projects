import 'package:cat_facts_clean_architecture/core/error/failures.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/entities/cat_facts.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/repositories/cat_facts_repository.dart';
import 'package:dartz/dartz.dart';

class GetCatFacts {
  final CatFactsRepository repository;

  GetCatFacts(this.repository);

  Future<Either<Failure, CatFacts>> getCatFacts() async {
    return await repository.getCatFacts();
  }
}
