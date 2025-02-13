import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spendytracking/presentation/home/bloc/home_bloc.dart';
import 'package:spendytracking/presentation/home/bloc/home_state.dart';
import 'package:spendytracking/presentation/home/widgets/body/spend_frequency_widget.dart';
import 'package:spendytracking/presentation/home/widgets/headers/circle_avatar_widget.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

import 'widgets/body/account_balance_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.oldLace,
        actions: [
          SvgPicture.asset(IconConstant.icNotification),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (_, state) {
              if (state is HomeSuccessState) {
                return CircleAvatarWidget(
                  avatarUrl: state.userModel.avatar ?? "",
                );
              }
              return CircleAvatarWidget(
                avatarUrl:
                    "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=800",
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          AccountBalanceWidget(),
          SpendFrequencyWidget()
        ],
      ),
    );
  }
}
