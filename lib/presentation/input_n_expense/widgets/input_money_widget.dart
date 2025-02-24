import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_text_style.dart';

class InputMoneyWidget extends StatefulWidget {
  const InputMoneyWidget({super.key});

  @override
  State<InputMoneyWidget> createState() => _InputMoneyWidgetState();
}

class _InputMoneyWidgetState extends State<InputMoneyWidget> {
  late TextEditingController textEditingController;
  static const _locale = 'vi';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(double.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;
  @override
  void initState() {
    textEditingController = TextEditingController(
      text: "0"
    );
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void _formatMoney(String value) {
    if (value.isEmpty) return;
    value = _formatNumber(value.replaceAll(RegExp(r'[^0-9]'), ''));
    textEditingController.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: AppColors.white,
      style: AppTextStyle.size64,
      keyboardType: TextInputType.number,
      onChanged: _formatMoney,
      decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          prefixText: _currency,
          prefixStyle: AppTextStyle.size64,
          border: InputBorder.none,
          hintText: "0",
          hintStyle: AppTextStyle.size64
      ),
    );
  }
}
