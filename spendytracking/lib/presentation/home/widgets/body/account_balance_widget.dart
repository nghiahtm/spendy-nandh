import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_size_default.dart';
import 'package:spendytracking/styles/app_text_style.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

import 'item_income_widget.dart';

class AccountBalanceWidget extends StatelessWidget {
  const AccountBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizeDefault.size16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: AppColors.oldLace),
      child: Column(
        children: [
          Text(
            "Account Balance",
            style: AppTextStyle.normal.copyWith(color: AppColors.grey),
          ),
          Text("9400\$",
              style: AppTextStyle.heading1.copyWith(color: AppColors.black)),
          const SizedBox(
            height: 27,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: ItemIncomeWidget(),
              ),
              const SizedBox(
                width: AppSizeDefault.size16,
              ),
              Flexible(
                child: ItemIncomeWidget(
                  backgroundColor: AppColors.red,
                  iconTypeMoney: IconConstant.icOutputDeposit,
                  title: "Expense",
                  money: 50000000000000,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 23,
          )
        ],
      ),
    );
  }
}
