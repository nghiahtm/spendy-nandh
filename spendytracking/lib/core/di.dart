import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiwi/kiwi.dart';
import 'package:spendytracking/core/helpers/local/shared_pref_helper.dart';
import 'package:spendytracking/data/data/local/user_share_pref.dart';
import 'package:spendytracking/data/data/remote/user_remote_fire_store.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';
import 'package:spendytracking/domain/repositories/auth_repository_impl.dart';
import 'package:spendytracking/domain/usecases/auth_usecase.dart';
import 'package:spendytracking/presentation/home/bloc/home_bloc.dart';
import 'package:spendytracking/presentation/login/bloc/login_bloc.dart';
import 'package:spendytracking/presentation/main/bloc/main_bloc.dart';
import 'package:spendytracking/presentation/profile/bloc/profile_bloc.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_bloc.dart';

import 'helpers/remote/firebase_helper.dart';
import 'helpers/remote/google_auth_helper.dart';

final kiwiContainer = KiwiContainer();

void setupContainer() {
  _helper();
  _data();
  _repositories();
  _usecases();
  _bloc();
}

void _helper() {
  kiwiContainer.registerSingleton<FirebaseFireStoreHelper>(
      (_) => FirebaseFireStoreHelper().init());
  kiwiContainer.registerSingleton<GoogleAuthHelper>(
      (_) => GoogleAuthHelper(googleSignIn: GoogleSignIn()));
  kiwiContainer.registerSingleton<SharedPrefHelper>((_) => SharedPrefHelper());
}

void _data() {
  kiwiContainer
      .registerSingleton<UserRemoteFireStore>((_) => UserRemoteFireStore(
            firebaseFireStoreHelper:
                kiwiContainer.resolve<FirebaseFireStoreHelper>(),
          ));
  kiwiContainer.registerSingleton<UserSharePref>((_) => UserSharePref(
        sharedPrefHelper: kiwiContainer.resolve<SharedPrefHelper>(),
      ));
}

void _repositories() {
  kiwiContainer.registerSingleton<AuthRepository>((_) => AuthRepositoryImpl(
      firebaseFireStoreHelper: kiwiContainer.resolve<FirebaseFireStoreHelper>(),
      googleAuthHelper: kiwiContainer.resolve<GoogleAuthHelper>(),
      userRemoteFireStore: kiwiContainer.resolve<UserRemoteFireStore>(),
      userSharePref: kiwiContainer.resolve<UserSharePref>()));
}

void _usecases() {
  kiwiContainer.registerSingleton((_) =>
      AuthUseCase(authRepository: kiwiContainer.resolve<AuthRepository>()));
}

void _bloc() {
  kiwiContainer.registerSingleton<SplashBloc>(
      (_) => SplashBloc(authUseCase: kiwiContainer.resolve<AuthUseCase>()));
  kiwiContainer.registerSingleton<LoginBloc>(
      (_) => LoginBloc(authUseCase: kiwiContainer.resolve<AuthUseCase>()));
  kiwiContainer.registerSingleton<HomeBloc>(
      (_) => HomeBloc(authUseCase: kiwiContainer.resolve<AuthUseCase>()));
  kiwiContainer.registerSingleton<MainBloc>((_) => MainBloc());
  kiwiContainer.registerSingleton<ProfileBloc>((_) => ProfileBloc(authUseCase: kiwiContainer.resolve<AuthUseCase>()));
}
