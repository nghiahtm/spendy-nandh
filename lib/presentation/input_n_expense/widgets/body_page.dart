import 'package:flutter/material.dart';
import 'package:spendytracking/presentation/input_n_expense/widgets/input_money_widget.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_text_style.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key, required this.title, this.backgroundColor});
  final String title;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          title,
          style: AppTextStyle.titleAppBarWhiteColor,
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bao nhiêu?",
                  style:
                      AppTextStyle.titleAppBarWhiteColor,
                ),
               InputMoneyWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
