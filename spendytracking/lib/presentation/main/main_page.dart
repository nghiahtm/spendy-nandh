import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendytracking/core/di.dart';
import 'package:spendytracking/presentation/home/home_page.dart';
import 'package:spendytracking/presentation/main/bloc/main_bloc.dart';
import 'package:spendytracking/presentation/main/bloc/main_state.dart';
import 'package:spendytracking/presentation/profile/profile_page.dart';

import 'bloc/main_event.dart';
import 'widget/app_bottom_appbar.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BlocBuilder<MainBloc, MainState>(builder: (_, state) {
        return AppBottomAppbar(
          onTapItem: (index) {
            kiwiContainer
                .resolve<MainBloc>()
                .add(ChangeTabNavigation(index: index));
            pageController.animateToPage(index - 1 > 0 ? index -1:0, duration: const Duration(milliseconds: 100), curve: Curves.linear);
          },
          indexSelected: state is InitialMainState
              ? state.indexTab
              : (state as ChangingTabState).indexTab,
        );
      }),
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          ProfilePage(),
          ProfilePage(),
          ProfilePage()
        ],
      ),
    );
  }
}
