import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/core/di.dart';
import 'package:spendytracking/presentation/home/home_page.dart';
import 'package:spendytracking/presentation/main/bloc/main_bloc.dart';
import 'package:spendytracking/presentation/main/bloc/main_state.dart';
import 'package:spendytracking/presentation/main/widget/app_fab_widget.dart';

import 'bloc/main_event.dart';
import 'widget/app_bottom_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar:
              BlocBuilder<MainBloc, MainState>(builder: (_, state) {
            return AppBottomAppbar(
              onTapItem: (index) {
                kiwiContainer
                    .resolve<MainBloc>()
                    .add(ChangeTabNavigation(index: index));
              },
              indexSelected: state is InitialMainState
                  ? state.indexTab
                  : (state as ChangingTabState).indexTab,
            );
          }),
          body: Stack(
            children: [
              PageView(
                children: [
                  HomePage(),
                ],
              ),
             // const AppFabWidget()
            ],
          ),
        ),
        const AppFabWidget(),
      ],
    );
  }
}
