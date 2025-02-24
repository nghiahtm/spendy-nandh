import 'package:flutter/material.dart';
import 'package:spendytracking/core/delagate/fab_delegate.dart';
import 'package:spendytracking/data/data/local/list_fab_data.dart';
import 'package:spendytracking/presentation/main/widget/app_button_fab.dart';
import 'package:spendytracking/routes/routes.dart';
import 'package:spendytracking/utils/constants/string_constants.dart';

class AppFabWidget extends StatefulWidget {
  const AppFabWidget({super.key});

  @override
  State<AppFabWidget> createState() => _AppFabWidgetState();
}

class _AppFabWidgetState extends State<AppFabWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  bool isOpen = false;
  double opaFABExpanded = 1;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 1, end: 0).animate(animationController);
    animationController.addListener(() {
      setState(() {
        opaFABExpanded = 1 - animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowFABDelegate(animation: animation),
      children: listFab
          .map<Widget>((e) => AppButtonFabWidget(
                svgIcon: e.icon ?? "",
                backgroundColor: e.color,
                onPressOpenCloseFAB: () {
                  isOpen = !isOpen;
                  setState(() {
                    if (isOpen) {
                      animationController.forward();
                      return;
                    }
                    animationController.reverse();
                  });
                },
                onPressExpandedFAB: () {
                  isOpen = false;
                  animationController.reverse();
                  Navigator.pushNamed(context, RoutesConstant.inputAndExpense,
                      arguments: {"type": e.name});
                },
                opacity: opaFABExpanded,
              ))
          .toList(),
    );
  }
}
