part of 'test_cubit.dart';

abstract class TestState {}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final CatFact fact;

  TestLoaded(this.fact);
}

class TestError extends TestState {
  final DioClient dioClient;
  final String errorMessage;
  TestError(this.dioClient, this.errorMessage);
}
