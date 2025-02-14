import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_text_style.dart';

class AppItemNavBarWidget extends StatelessWidget {
  const AppItemNavBarWidget(
      {super.key,
      required this.title,
      required this.svgIcon,
      this.onTap,
      this.isSelected = false});
  final String title;
  final String svgIcon;
  final bool isSelected;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            svgIcon,
            colorFilter: ColorFilter.mode(
                isSelected ? AppColors.violet100 : AppColors.silverSand,
                BlendMode.srcIn),
          ),
          Text(
            title,
            style: AppTextStyle.normal.copyWith(
                color: isSelected ? AppColors.violet100 : AppColors.silverSand),
          )
        ],
      ),
    );
  }
}
