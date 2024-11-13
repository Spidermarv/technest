import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technest/blocks/splash_state.dart';

class SplahCubit extends Cubit<SplashState> {
  SplahCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(UnAuthenticated());
  }
}
