part of 'cat_facts_cubit.dart';

abstract class CatFactsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CatFactsInitial extends CatFactsState {}

class CatFactsLoading extends CatFactsState {}

class CatFactsLoaded extends CatFactsState {
  final CatFacts facts;

  CatFactsLoaded(this.facts);

  @override
  List<Object?> get props => [facts];
}

class CatFactsError extends CatFactsState {
  final String message;
  CatFactsError(this.message);

  @override
  List<Object?> get props => [message];
}
