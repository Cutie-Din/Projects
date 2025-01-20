import 'package:bloc/bloc.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/entities/cat_facts.dart';
import 'package:cat_facts_clean_architecture/features/cat_facts/domain/usecases/get_cat_facts.dart';

part 'cat_facts_state.dart';

class CatFactsCubit extends Cubit<CatFactsState> {
  final GetCatFacts getCatFacts;
  CatFactsCubit(this.getCatFacts) : super(CatFactsInitial());

  Future<void> fetchCatFacts() async {
    emit(CatFactsLoading());
    final result = await getCatFacts.getCatFacts();
    result.fold(
      (failure) => emit(CatFactsError("Lỗi khi lấy dữ liệu")),
      (facts) => emit(CatFactsLoaded(facts)),
    );
  }
}
