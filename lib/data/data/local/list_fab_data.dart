import 'package:spendytracking/data/models/button_fab_model.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';
import 'package:spendytracking/utils/constants/string_constants.dart';

final listFab = <ButtonFabModel>[
  ButtonFabModel(
    color: AppColors.jade,
    icon: IconConstant.icInputDeposit,
    name: StringConstants.income
  ),
  ButtonFabModel(),
  ButtonFabModel(
      color: AppColors.red,
      icon: IconConstant.icOutputDeposit,
      name: StringConstants.expense
  ),
  ButtonFabModel(
      icon: IconConstant.icAdd,
      name: "change",
  ),
];