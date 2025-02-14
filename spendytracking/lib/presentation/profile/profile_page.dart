import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:spendytracking/presentation/profile/bloc/profile_bloc.dart';
import 'package:spendytracking/presentation/profile/bloc/profile_event.dart';
import 'package:spendytracking/presentation/profile/bloc/profile_state.dart';
import 'package:spendytracking/presentation/profile/widget/body/item_body.dart';
import 'package:spendytracking/presentation/profile/widget/body/profile_body.dart';
import 'package:spendytracking/presentation/profile/widget/header/profile_header.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_size_default.dart';

import '../../routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileInit) {
            return;
          }
          if(state is ProfileLoading){
            EasyLoading.show(status: 'Loading...', dismissOnTap: true);
            return;
          }
          if(state is ProfileAfterLogoutSuccess){
            EasyLoading.dismiss();
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesConstant.login, (_) => false);
            return;
          }
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(AppSizeDefault.size16),
            color: AppColors.grey20,
            child: Column(
              children: [
                ProfileHeader(),
                ProfileBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
