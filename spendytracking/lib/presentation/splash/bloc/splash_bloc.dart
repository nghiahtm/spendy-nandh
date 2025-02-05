import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/domain/usecases/auth_usecase.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_event.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthUseCase authUseCase;
  SplashBloc({required this.authUseCase}) : super(SplashInitial()) {
    on<SplashNavigate>(onInitNavigationSplash);
  }

  void onInitNavigationSplash(
      SplashNavigate event, Emitter<SplashState> emit)async {
    final id = await authUseCase.getUserLocal();
    if (id == null || id.isEmpty) {
      emit(SplashNavigateLogin());
      return;
    }
    emit(SplashNavigateHome());
  }
}
