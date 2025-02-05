import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:spendytracking/core/di.dart';
import 'package:spendytracking/presentation/login/bloc/login_bloc.dart';
import 'package:spendytracking/presentation/login/bloc/login_event.dart';
import 'package:spendytracking/presentation/login/bloc/login_state.dart';
import 'package:spendytracking/routes/routes.dart';
import 'package:spendytracking/styles/app_button.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_image.dart';
import 'package:spendytracking/styles/app_text_style.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Đăng nhập",
          style: AppTextStyle.titleAppBar,
        ),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is LoginLoading) {
            EasyLoading.show(status: 'Loading...', dismissOnTap: true);
            return;
          }
          if (state is LoginSuccess) {
            EasyLoading.dismiss();
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesConstant.main, (_) => false);
            return;
          }
          if (state is LoginError) {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Text(state.error),
                    title: const Center(child: Text("Error")),
                  );
                });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: AppButton(
            onPressed: () {
              kiwiContainer.resolve<LoginBloc>().add(LoginEventGetUser());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  const AppImage(img: IconConstant.iconGoogle),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Đăng nhập bằng Google",
                    style: AppTextStyle.normal.copyWith(color: AppColors.white),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
