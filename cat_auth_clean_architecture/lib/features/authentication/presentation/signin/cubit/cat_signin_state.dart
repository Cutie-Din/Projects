part of 'cat_signin_cubit.dart';

abstract class CatSigninState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CatSignInIntial extends CatSigninState {}

class CatSignInLoading extends CatSigninState {}

class CatSignInLoaded extends CatSigninState {
  final CatSignIn catSignIn;
  CatSignInLoaded(this.catSignIn);

  @override
  List<Object?> get props => [catSignIn];
}

class CatSignInError extends CatSigninState {
  final String message;
  CatSignInError(this.message);

  @override
  List<Object?> get props => [message];
}
