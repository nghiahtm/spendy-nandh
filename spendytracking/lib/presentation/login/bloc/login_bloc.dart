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
    /// CHECK USER STILL IN FIRESTORE
    final stateUserExistedFirestore = await authUseCase.getStateUserStillOnFirestore();
    if(stateUserExistedFirestore.contains("Not Found User")){
      emit(LoginError(error: stateUserExistedFirestore));
      return;
    }
    if(stateUserExistedFirestore.contains("Success")){
      emit(LoginSuccess());
      return;
    }
    /// ADD USER To Firestore
    final stateUser = await authUseCase.addUser();
    if (stateUser != null && stateUser.isNotEmpty) {
      emit(LoginError(error: stateUser));
      return;
    }
    final stateUserLocal = await authUseCase.setUserIdLocal();
    if(stateUserLocal != null){
      emit(LoginError(error: stateUserLocal));
      return;
    }
    emit(LoginSuccess());
  }
}
