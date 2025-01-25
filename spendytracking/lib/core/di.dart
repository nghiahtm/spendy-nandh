import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiwi/kiwi.dart';
import 'package:spendytracking/data/helpers/remote/firebase_helper.dart';
import 'package:spendytracking/data/helpers/remote/google_auth_helper.dart';
import 'package:spendytracking/data/repositories/auth_repository.dart';
import 'package:spendytracking/domain/repositories/auth_repository_impl.dart';
import 'package:spendytracking/domain/usecases/auth_usecase.dart';
import 'package:spendytracking/presentation/login/bloc/login_bloc.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_bloc.dart';

final kiwiContainer = KiwiContainer();

void setupContainer() {
  _data();
  _repositories();
  _usecases();
  _bloc();
}

void _data() {
  kiwiContainer.registerSingleton<FirebaseFireStoreHelper>(
      (_) => FirebaseFireStoreHelper().init());
  kiwiContainer.registerSingleton<GoogleAuthHelper>(
      (_) => GoogleAuthHelper(googleSignIn: GoogleSignIn()));
}

void _repositories() {
  kiwiContainer.registerSingleton<AuthRepository>((_) => AuthRepositoryImpl(
      firebaseFireStoreHelper: kiwiContainer.resolve<FirebaseFireStoreHelper>(),
      googleAuthHelper: kiwiContainer.resolve<GoogleAuthHelper>()));
}

void _usecases() {
  kiwiContainer.registerSingleton((_) =>
      AuthUseCase(authRepository: kiwiContainer.resolve<AuthRepository>()));
}

void _bloc() {
  kiwiContainer.registerSingleton<SplashBloc>((_) => SplashBloc());
  kiwiContainer.registerSingleton<LoginBloc>(
      (_) => LoginBloc(authUseCase: kiwiContainer.resolve<AuthUseCase>()));
}
