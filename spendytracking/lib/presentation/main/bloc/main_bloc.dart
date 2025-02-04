import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/presentation/main/bloc/main_event.dart';
import 'package:spendytracking/presentation/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState>{
  MainBloc():super(InitialMainState()){
    on<ChangeTabNavigation>(onChangeTab);
  }

  void onChangeTab(ChangeTabNavigation event, Emitter<MainState> emit) {
    emit(InitialMainState(indexTab: event.index));
  }
}