import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spendytracking/styles/app_button.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_size_default.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

class AppButtonFabWidget extends StatelessWidget {
  const AppButtonFabWidget(
      {super.key,
      this.svgIcon = "",
      required this.onPressOpenCloseFAB,
      this.opacity = 0,
      required this.onPressExpandedFAB, this.backgroundColor});
  final String svgIcon;
  final Function() onPressOpenCloseFAB;
  final Function() onPressExpandedFAB;
  final double opacity;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    if (svgIcon.isEmpty) return const SizedBox();
    if (svgIcon.contains(IconConstant.icAdd)) {
      return _AppFABButton(
        onPressExpandedFAB: onPressOpenCloseFAB,
        svgIcon: svgIcon,
        backgroundColor: backgroundColor,
      );
    }
    return Opacity(
      opacity: opacity,
      child: _AppFABButton(
        onPressExpandedFAB: onPressExpandedFAB,
        svgIcon: svgIcon,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class _AppFABButton extends StatelessWidget {
  const _AppFABButton({
    super.key,
    required this.onPressExpandedFAB,
    required this.svgIcon,
    this.backgroundColor,
  });

  final Function() onPressExpandedFAB;
  final String svgIcon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: backgroundColor,
      onPressed: onPressExpandedFAB,
      shape: const CircleBorder(),
      miniSize:
          const Size(AppSizeDefault.sizeButton, AppSizeDefault.sizeButton),
      child: SizedBox(
        width: 30,
        child: SvgPicture.asset(
          svgIcon,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          errorBuilder: (_, __, ___) => const SizedBox(),
        ),
      ),
    );
  }
}
