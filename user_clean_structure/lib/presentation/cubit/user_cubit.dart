import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_clean_structure/domain/repository/user_repository.dart';

import '../../core/network/dio_client.dart';
import '../../domain/entity/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;
  final DioClient dioClient;
  int since = 1;
  int perPage = 2;
  bool isFetching = false;

  UserCubit(this.repository, this.dioClient) : super(UserInitial()) {
    fetchUsers();
  }

  Future<void> fetchUsers({bool isLoadMore = false}) async {
    if (isFetching) return;

    isFetching = true;
    emit(isLoadMore ? UserLoadingMore() : UserLoading());

    // Gọi repository để lấy dữ liệu từ API
    final result = await repository.getUsers(since: since, perPage: perPage);

    result.fold(
      (failure) {
        final errorMessage = dioClient.errorMessage ?? "Lỗi đã xảy ra";
        emit(UserError(dioClient, errorMessage));
      },
      (users) {
        if (state is UserLoaded) {
          final currentState = state as UserLoaded;

          // Nối dữ liệu mới vào danh sách cũ
          emit(UserLoaded(
            users: currentState.users + users,
            hasReachedMax: users.isEmpty,
          ));
        } else {
          // Nếu chưa có dữ liệu, emit UserLoaded với dữ liệu mới
          emit(UserLoaded(users: users, hasReachedMax: users.isEmpty));
        }

        // Cập nhật `since` và `perPage` nếu có dữ liệu mới
        if (users.isNotEmpty) {
          perPage += 1; // Tăng `perPage` cho lần tải tiếp theo
        }
      },
    );

    isFetching = false;
  }
}
