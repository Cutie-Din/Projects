import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_clean_structure/domain/repository/user_repository.dart';

import '../../core/network/dio_client.dart';
import '../../domain/entity/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;
  final DioClient dioClient;
  int since = 1;
  int perPage = 10;

  UserCubit(this.repository, this.dioClient) : super(UserInitial()) {
    fetchUsers();
  }

  Future<void> fetchUsers({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      emit(UserLoading());
      since = 1;
    }

    final result = await repository.getUsers(since: since, perPage: perPage);

    result.fold(
      (failure) {
        final errorMessage = dioClient.errorMessage ?? "Lỗi đã xảy ra";
        emit(UserError(dioClient, errorMessage));
      },
      (users) {
        if (state is UserLoaded) {
          final currentState = state as UserLoaded;

          if (users.isNotEmpty) {
            final updatedUsers = List<User>.from(currentState.users);
            updatedUsers.addAll(
                users); // Hoặc final updatedUsers = List<User>.from(currentState.users)..addAll(users)
            emit(UserLoaded(
              users: updatedUsers,
              hasReachedMax: users.isEmpty,
            ));

            since += 1;
          }
        } else {
          emit(UserLoaded(users: users, hasReachedMax: users.isEmpty));
          if (users.isNotEmpty) {
            since += 1;
          }
        }
      },
    );
  }
}
