import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable{}

class LoginInit extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoading extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginError extends LoginState{
  final String error;

  LoginError({this.error = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

