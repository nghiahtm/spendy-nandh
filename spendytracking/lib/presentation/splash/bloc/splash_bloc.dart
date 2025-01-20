import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_event.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashNavigate>(onInitNavigationSplash);
  }

  void onInitNavigationSplash(
      SplashNavigate event, Emitter<SplashState> emit) async {
    if (event.userJson == null || event.userJson!.isEmpty) {
      emit(SplashNavigateLogin());
      return;
    }
    emit(SplashNavigateHome());
  }
}
