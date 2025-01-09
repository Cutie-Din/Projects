part of 'cat_signup_cubit.dart';

abstract class CatSignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CatSignUpIntial extends CatSignUpState {}

class CatSignUpLoading extends CatSignUpState {}

class CatSignUpLoaded extends CatSignUpState {
  final CatSignUp catsignup;
  CatSignUpLoaded(this.catsignup);

  @override
  List<Object?> get props => [catsignup];
}

class CatSignUpError extends CatSignUpState {
  final String message;
  CatSignUpError(this.message);

  @override
  List<Object?> get props => [message];
}
