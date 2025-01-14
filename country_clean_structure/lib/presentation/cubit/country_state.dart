part of 'country_cubit.dart';

abstract class CountryState {
  const CountryState();
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoadingMore extends CountryState {
  final List<Country> currentCountries;

  CountryLoadingMore(this.currentCountries);
}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  CountryLoaded(this.countries);
}

class CountryError extends CountryState {
  final DioClient dioClient;
  final String errorMessage;

  CountryError(this.dioClient, this.errorMessage);
}
