import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_thing/core/network/dio_client.dart';
import 'package:test_thing/domain/entity/cat_fact.dart';

import '../../domain/usecase/get_cat_fact.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final GetCatFact getCatFacts;
  final DioClient dioClient;
  TestCubit(this.getCatFacts, this.dioClient) : super(TestInitial());

  Future<void> fetchCatFact() async {
    emit(TestLoading());
    final result = await getCatFacts.getCatFact();
    result.fold(
      (failure) {
        final errorMessage = dioClient.errorMessage ?? "Lỗi đã xảy ra";
        emit(TestError(dioClient, errorMessage));
      },
      (facts) => emit(TestLoaded(facts)),
    );
  }
}
