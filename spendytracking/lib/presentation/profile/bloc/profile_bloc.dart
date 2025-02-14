import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/presentation/profile/bloc/profile_event.dart';
import 'package:spendytracking/presentation/profile/bloc/profile_state.dart';

import '../../../domain/usecases/auth_usecase.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState> {
  final AuthUseCase authUseCase;

  ProfileBloc({required this.authUseCase}) : super(ProfileInit()){
    on<EditProfile>(onEditProfile);
    on<ProfileLogOut>(onLogout);
  }
  void onEditProfile(ProfileEvent event, Emitter<ProfileState> emit) async {

  }

  void onLogout(ProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    await authUseCase.logout();
    emit(ProfileAfterLogoutSuccess());
  }
}