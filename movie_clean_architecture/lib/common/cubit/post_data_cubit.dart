import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../core/network/dio_client.dart';
import '../../domain/auth/repositories/auth.dart';

part 'post_data_state.dart';

class PostCubit extends Cubit<PostDataState> {
  final AuthRepository authRepository;
  final DioClient dioClient;

  PostCubit(this.authRepository, this.dioClient) : super(PostDataInitial());

  // Sign Up method
  Future<void> signUp(String email, String password) async {
    emit(PostDataLoading());
    final result = await authRepository.postSignUp(email, password);
    result.fold(
      (error) {
        final errorMessage = dioClient.errorMessage ?? "Lỗi đã xảy ra";
        emit(PostDataError(dioClient, errorMessage));
      },
      (signUp) => emit(PostDataSuccess(signUp)),
    );
  }

  // Sign In method
  Future<void> signIn(String email, String password) async {
    emit(PostDataLoading());
    final result = await authRepository.postSignIn(email, password);
    result.fold(
      (error) {
        final errorMessage = dioClient.errorMessage ?? "Lỗi đã xảy ra";
        emit(PostDataError(dioClient, errorMessage));
      },
      (signIn) => emit(PostDataSuccess(signIn)),
    );
  }
}
