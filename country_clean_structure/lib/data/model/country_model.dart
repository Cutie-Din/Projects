import 'package:country_clean_structure/domain/entity/country.dart';

class CountryModel {
  final String common;
  final String official;
  final String png;

  const CountryModel({
    required this.common,
    required this.official,
    required this.png,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      common: json['name']['common'] ?? '',
      official: json['name']['official'] ?? '',
      png: json['flags']['png'] ?? '',
    );
  }

  Country toEntity() {
    return Country(
      common,
      official,
      png,
    );
  }
}
