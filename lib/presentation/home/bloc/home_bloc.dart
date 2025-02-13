import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/domain/usecases/auth_usecase.dart';
import 'package:spendytracking/presentation/home/bloc/home_event.dart';
import 'package:spendytracking/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthUseCase authUseCase;
  HomeBloc({required this.authUseCase}) : super(HomeInitState()) {
    on<HomeEventShowUser>(onLoginGetUser);
  }

  void onLoginGetUser(HomeEventShowUser event, Emitter<HomeState> emit) async {
    if (authUseCase.userModel == null) {
      emit(HomeErrorState(error: "Error"));
      return;
    }
    emit(HomeSuccessState(userModel: authUseCase.userModel!));
  }
}
