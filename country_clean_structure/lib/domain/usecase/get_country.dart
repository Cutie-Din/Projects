import 'package:country_clean_structure/core/network/dio_client.dart';
import 'package:country_clean_structure/domain/entity/country.dart';
import 'package:country_clean_structure/domain/repository/country_repository.dart';
import 'package:dartz/dartz.dart';

class GetCountry {
  final CountryRepository repository;
  GetCountry(this.repository);

  Future<Either<DioClient, List<Country>>> call() async {
    return await repository.getCountries();
  }
}
