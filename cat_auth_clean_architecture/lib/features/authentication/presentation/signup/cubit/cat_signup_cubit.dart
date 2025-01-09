import 'package:bloc/bloc.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signup.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/usecases/post_cat_auth.dart';
import 'package:equatable/equatable.dart';

part 'cat_signup_state.dart';

class CatSignUpCubit extends Cubit<CatSignUpState> {
  final PostCatAuth postCatAuth;

  CatSignUpCubit(this.postCatAuth) : super(CatSignUpIntial());

  Future<void> sendCatSignUp(String email, String username, String password) async {
    emit(CatSignUpLoading()); // Thông báo trạng thái loading khi bắt đầu
    final result = await postCatAuth.postCatSignUp(email, username, password);
    result.fold(
      (failure) => emit(CatSignUpError("Lỗi khi đẩy dữ liệu")), // Nếu thất bại, emit trạng thái lỗi
      (signUp) => emit(CatSignUpLoaded(signUp)), // Nếu thành công, emit trạng thái loaded
    );
  }
}
