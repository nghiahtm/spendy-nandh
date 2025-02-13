import 'package:equatable/equatable.dart';

sealed class MainEvent extends Equatable {}

class ChangeTabNavigation extends MainEvent {
  final int index;

  ChangeTabNavigation({this.index = 1});

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
