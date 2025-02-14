import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/styles/app_size_default.dart';

import '../../../home/bloc/home_bloc.dart';
import '../../../home/bloc/home_state.dart';
import '../../../home/widgets/headers/circle_avatar_widget.dart';

class ProfileHeader extends StatelessWidget{
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (_, state) {
            if (state is HomeSuccessState) {
              return Container(
                padding:const EdgeInsets.all(AppSizeDefault.size4),
                decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple)),
                child: CircleAvatarWidget(
                  radius: 40,
                  avatarUrl: state.userModel.avatar ?? "",
                ),
              );
            }
            return const CircleAvatarWidget(
              radius: 40,
              avatarUrl:
              "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=800",
            );
          },
        ),
      ],
    );
  }
}