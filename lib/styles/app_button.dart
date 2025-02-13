import 'package:flutter/material.dart';
import 'package:spendytracking/styles/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onPressed,
      this.child,
      this.backgroundColor,
      this.rounderBorder});
  final Function() onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final double? rounderBorder;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.violet100,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(rounderBorder ?? 12), // <-- Radius
          )),
      child: child ?? const SizedBox(),
    );
  }
}
