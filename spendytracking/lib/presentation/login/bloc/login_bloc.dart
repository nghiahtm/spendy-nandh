import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/presentation/login/bloc/login_event.dart';
import 'package:spendytracking/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(super.initialState);

}