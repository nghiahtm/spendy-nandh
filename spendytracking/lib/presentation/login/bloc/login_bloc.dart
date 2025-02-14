import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/domain/usecases/auth_usecase.dart';
import 'package:spendytracking/presentation/login/bloc/login_event.dart';
import 'package:spendytracking/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase authUseCase;
  LoginBloc({required this.authUseCase}) : super(LoginInit()) {
    on<LoginEventGetUser>(onLoginGetUser);
  }

  void onLoginGetUser(LoginEventGetUser event, Emitter<LoginState> emit) async {
    emit(LoginInit());
    final result = await authUseCase.stateUserLogin();
    if (result != null && result.isNotEmpty) {
      emit(LoginError(error: result));
      return;
    }
    emit(LoginLoading());
    final stateUser = await authUseCase.addUser();
    if (stateUser != null && stateUser.isNotEmpty) {
      emit(LoginError(error: stateUser));
      return;
    }
    final stateUserLocal = await authUseCase.setUserId();
    if(stateUserLocal != null){
      return emit(LoginError(error: stateUserLocal));
    }
    emit(LoginSuccess());
  }
}
