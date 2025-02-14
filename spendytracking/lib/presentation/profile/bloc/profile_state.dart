import 'package:equatable/equatable.dart';

sealed class ProfileState extends Equatable{}

class ProfileInit extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ProfileLoading extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ProfileAfterLogoutSuccess extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}