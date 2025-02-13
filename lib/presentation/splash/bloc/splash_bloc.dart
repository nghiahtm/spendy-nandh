import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/domain/usecases/auth_usecase.dart';
import 'package:spendytracking/domain/usecases/save_user_login_auth_case.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_event.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthUseCase authUseCase;
  final SaveUserToSqliteUseCase saveUserToSqliteUseCase;
  SplashBloc({
    required this.authUseCase,
    required this.saveUserToSqliteUseCase,
  }) : super(SplashInitial()) {
    on<SplashNavigate>(onInitNavigationSplash);
  }

  void onInitNavigationSplash(
      SplashNavigate event, Emitter<SplashState> emit) async {
    final stateUser = await saveUserToSqliteUseCase.getInforUserSQLite();
    print(stateUser);
    if (stateUser.isNotEmpty) {
      emit(SplashNavigateLogin());
      return;
    }
    emit(SplashNavigateHome());
  }
}
