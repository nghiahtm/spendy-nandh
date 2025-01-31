import 'package:flutter/material.dart';
import 'package:spendytracking/styles/app_colors.dart';

class AppTextStyle {
  static TextStyle heading1 = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.white
  );

  static TextStyle heading4 = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.white
  );
  static TextStyle titleAppBar = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.black
  );

  static TextStyle normal =const  TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal
  );
}