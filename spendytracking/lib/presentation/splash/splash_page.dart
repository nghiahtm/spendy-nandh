import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_bloc.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_event.dart';
import 'package:spendytracking/presentation/splash/bloc/splash_state.dart';
import 'package:spendytracking/routes/routes.dart';
import 'package:spendytracking/styles/app_text_style.dart';
import 'package:spendytracking/utils/constants/string_constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (_, state) {
        if (state is SplashNavigateHome) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesConstant.home, (_) => false);
          return;
        }
        if (state is SplashNavigateLogin) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesConstant.login, (_) => false);
          return;
        }
      },
      child: Scaffold(
        body: Center(
          child: Text(
            StringConstants.nameApp,
            style: AppTextStyle.heading1,
          ),
        ),
      ),
    );
  }
}
