import 'package:equatable/equatable.dart';
import 'package:spendytracking/data/models/user_model.dart';

sealed class HomeState extends Equatable {}

class HomeSuccessState extends HomeState {
  final UserModel userModel;

  HomeSuccessState({required this.userModel});
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}

class HomeInitState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String? error;
  HomeErrorState({this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

