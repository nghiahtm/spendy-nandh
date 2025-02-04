import 'package:equatable/equatable.dart';

sealed class MainState extends Equatable{}

class InitialMainState extends MainState {
  final int indexTab;

  InitialMainState({ this.indexTab = 1});

  @override
  // TODO: implement props
  List<Object?> get props => [indexTab];
}

class ChangingTabState extends MainState {
  final int indexTab;

  ChangingTabState({ this.indexTab = 1});

  @override
  // TODO: implement props
  List<Object?> get props => [indexTab];
}