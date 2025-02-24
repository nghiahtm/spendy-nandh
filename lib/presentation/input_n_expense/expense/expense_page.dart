import 'package:flutter/material.dart';
import 'package:spendytracking/presentation/input_n_expense/widgets/body_page.dart';
import 'package:spendytracking/styles/app_colors.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyPage(title: "Chi",backgroundColor: AppColors.red,);
  }
}
