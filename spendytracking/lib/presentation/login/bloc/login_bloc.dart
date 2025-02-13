import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/domain/usecases/auth_usecase.dart';
import 'package:spendytracking/domain/usecases/save_user_login_auth_case.dart';
import 'package:spendytracking/presentation/login/bloc/login_event.dart';
import 'package:spendytracking/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SaveUserToSqliteUseCase authUseCase;
  LoginBloc({required this.authUseCase}) : super(LoginInit()) {
    on<LoginEventGetUser>(onLoginGetUser);
  }

  void onLoginGetUser(LoginEventGetUser event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await authUseCase.stateUserLogin();
    if (result != null && result.isNotEmpty) {
      emit(LoginError(error: result));
      return;
    }
    emit(LoginSuccess());
  }

}
