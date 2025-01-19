part of 'post_data_cubit.dart';

abstract class PostDataState {}

class PostDataInitial extends PostDataState {}

class PostDataLoading extends PostDataState {}

class PostDataSuccess extends PostDataState {
  final dynamic data;
  PostDataSuccess(this.data);
}

class PostDataError extends PostDataState {
  final DioClient dioClient;
  final String errorMessage;
  PostDataError(this.dioClient, this.errorMessage);
}
