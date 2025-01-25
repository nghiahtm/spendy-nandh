import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable{}

class LoginEventGetUser extends LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}