import 'package:country_clean_structure/core/network/dio_client.dart';
import 'package:country_clean_structure/domain/entity/country.dart';
import 'package:dartz/dartz.dart';

abstract class CountryRepository {
  Future<Either<DioClient, List<Country>>> getCountries();
}
