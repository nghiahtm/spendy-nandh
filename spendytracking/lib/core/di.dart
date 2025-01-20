import 'package:kiwi/kiwi.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_bloc.dart';

final kiwiContainer = KiwiContainer();

void setupContainer(){
  kiwiContainer.registerSingleton<SplashBloc>((_)=> SplashBloc());
}

