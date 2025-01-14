part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoadingMore extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  final bool hasReachedMax;

  UserLoaded({required this.users, required this.hasReachedMax});
}

class UserError extends UserState {
  final DioClient dioClient;
  final String errorMessage;

  UserError(this.dioClient, this.errorMessage);
}
