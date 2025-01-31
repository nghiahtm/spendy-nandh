import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_text_style.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

class ItemIncomeWidget extends StatelessWidget {
  const ItemIncomeWidget(
      {super.key,
      this.backgroundColor = AppColors.jade,
      this.iconTypeMoney = IconConstant.icInputDeposit,
      this.title = "Income",
      this.money = 0});
  final Color backgroundColor;
  final String iconTypeMoney;
  final String title;
  final int money;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(28)),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16)),
            child: SvgPicture.asset(iconTypeMoney),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.normal.copyWith(color: AppColors.white),
                ),
                Flexible(
                  child: Text(
                    "\$$money",
                    style: AppTextStyle.heading4,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
