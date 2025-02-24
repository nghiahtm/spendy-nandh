import 'package:flutter/material.dart';
import 'package:spendytracking/presentation/input_n_expense/expense/expense_page.dart';
import 'package:spendytracking/presentation/input_n_expense/input/income_page.dart';
import 'package:spendytracking/utils/constants/string_constants.dart';

class InputAndExpensePage extends StatelessWidget {
  const InputAndExpensePage({super.key, required this.args});
  final String args;
  @override
  Widget build(BuildContext context) {
    switch (args) {
      case StringConstants.expense:
        return  const ExpensePage();
      case StringConstants.income:
        return const  IncomePage();
      default:
        return const SizedBox();
    }
  }
}
