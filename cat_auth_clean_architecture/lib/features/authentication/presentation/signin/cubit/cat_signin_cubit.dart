import 'package:bloc/bloc.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/entities/cat_signin.dart';
import 'package:cat_auth_clean_architecture/features/authentication/domain/usecases/post_cat_auth.dart';
import 'package:equatable/equatable.dart';

part 'cat_signin_state.dart';

class CatSignInCubit extends Cubit<CatSigninState> {
  final PostCatAuth postCatAuth;
  CatSignInCubit(this.postCatAuth) : super(CatSignInIntial());

  Future<void> postCatSignIn(String email, String password) async {
    emit(CatSignInLoading());
    final result = await postCatAuth.postCatSignIn(email, password);
    result.fold(
      (failure) => emit(CatSignInError("Lỗi khi đẩy dữ liệu")),
      (signIn) => emit(CatSignInLoaded(signIn)),
    );
  }
}
