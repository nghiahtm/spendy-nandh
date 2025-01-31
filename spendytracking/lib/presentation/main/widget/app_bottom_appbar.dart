import 'package:flutter/material.dart';
import 'package:spendytracking/presentation/main/widget/app_item_nav_bar.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

class AppBottomAppbar extends StatelessWidget {
  const AppBottomAppbar(
      {super.key, required this.onTapItem, this.indexSelected = 0});
  final Function(int) onTapItem;
  final int indexSelected;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppItemNavBarWidget(
              title: "Home",
              svgIcon: IconConstant.icHome,
              isSelected: indexSelected == 1,
              onTap: () {
                onTapItem(1);
              },
            ),
            AppItemNavBarWidget(
              title: "Transaction",
              svgIcon: IconConstant.icTransaction,
              isSelected: indexSelected == 2,
              onTap: () {
                onTapItem(2);
              },
            ),
            const SizedBox(width: 40), // The dummy child
            AppItemNavBarWidget(
              title: "Budget",
              svgIcon: IconConstant.icBudget,
              isSelected: indexSelected == 3,
              onTap: () {
                onTapItem(3);
              },
            ),
            AppItemNavBarWidget(
              title: "Profile",
              svgIcon: IconConstant.icProfile,
              isSelected: indexSelected == 4,
              onTap: () {
                onTapItem(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
