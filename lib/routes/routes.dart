import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/core/di.dart';
import 'package:spendytracking/presentation/home/bloc/home_bloc.dart';
import 'package:spendytracking/presentation/home/bloc/home_event.dart';
import 'package:spendytracking/presentation/home/home_page.dart';
import 'package:spendytracking/presentation/login/bloc/login_bloc.dart';
import 'package:spendytracking/presentation/login/login_page.dart';
import 'package:spendytracking/presentation/main/bloc/main_bloc.dart';
import 'package:spendytracking/presentation/main/main_page.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_bloc.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_event.dart';
import 'package:spendytracking/presentation/splash/splash_page.dart';

class RoutesConstant {
  static const String init = "/";
  static const String login = "/login";
  static const String main = "/main";
  static const String inputDeposit = "/input_deposit";
  static const String outputDeposit = "/output_deposit";
}

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesConstant.init: (_) => BlocProvider(
        create: (BuildContext context) {
          return kiwiContainer.resolve<SplashBloc>()..add(SplashNavigate());
        },
        child: const SplashPage()),
    RoutesConstant.login: (_) => BlocProvider(
        create: (_) {
          return kiwiContainer.resolve<LoginBloc>();
        },
        child: const LoginPage()),
    RoutesConstant.main: (_) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (_) => kiwiContainer.resolve<MainBloc>(),
          ),
          BlocProvider(
            create: (_) =>
                kiwiContainer.resolve<HomeBloc>()..add(HomeEventShowUser()),
          )
        ], child: const MainPage()),
  };
}
