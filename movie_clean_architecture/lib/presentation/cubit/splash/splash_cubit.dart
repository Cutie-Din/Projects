import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(Splashed());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    emit(UnAuthenticated());
  }
}
