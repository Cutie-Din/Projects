part of 'cat_facts_cubit.dart';

abstract class CatFactsState {}

class CatFactsInitial extends CatFactsState {}

class CatFactsLoading extends CatFactsState {}

class CatFactsLoaded extends CatFactsState {
  final CatFacts facts;

  CatFactsLoaded(this.facts);
}

class CatFactsError extends CatFactsState {
  final String message;
  CatFactsError(this.message);
}
