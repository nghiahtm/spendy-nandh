import 'package:flutter/material.dart';
import 'package:spendytracking/presentation/input_n_expense/widgets/body_page.dart';
import 'package:spendytracking/styles/app_colors.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyPage(
      title: "Thu",
      backgroundColor: AppColors.jade,
    );
  }
}
