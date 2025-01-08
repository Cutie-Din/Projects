import 'package:cat_facts_clean_architecture/core/error/failures.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/data/data_sources/cat_facts_api_service.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/data/data_sources/cat_facts_api_service_old.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/entities/cat_facts.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/repositories/cat_facts_repository.dart';
import 'package:dartz/dartz.dart';

class CatFactsRepositoryImp implements CatFactsRepository {
  final CatFactsApiService catFactsApiService;
  CatFactsRepositoryImp(this.catFactsApiService);

  // final CatFactsApiServiceOld catFactsApiService;
  // CatFactsRepositoryImp(this.catFactsApiService);

  @override
  Future<Either<Failure, CatFacts>> getCatFacts() async {
    try {
      final result = await catFactsApiService.getCatFacts();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
