import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable{}

class EditProfile extends ProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ProfileLogOut extends ProfileEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}