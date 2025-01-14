import 'package:country_clean_structure/core/network/dio_client.dart';
import 'package:country_clean_structure/data/data_source/country_api_service.dart';
import 'package:country_clean_structure/domain/entity/country.dart';
import 'package:country_clean_structure/domain/repository/country_repository.dart';
import 'package:dartz/dartz.dart';

import '../../injection.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryApiService countryApiService;
  CountryRepositoryImpl(this.countryApiService);

  @override
  Future<Either<DioClient, List<Country>>> getCountries() async {
    try {
      final response = await countryApiService.getCountries();

      final countries = response.map((model) => model.toEntity()).toList();

      return Right(countries);
    } catch (e) {
      return Left(sl<DioClient>());
    }
  }
}
