import 'package:spendytracking/data/models/button_fab_model.dart';
import 'package:spendytracking/routes/routes.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

final listFab = <ButtonFabModel>[
  ButtonFabModel(
    color: AppColors.jade,
    icon: IconConstant.icInputDeposit,
    name: RoutesConstant.inputDeposit
  ),
  ButtonFabModel(),
  ButtonFabModel(
      color: AppColors.red,
      icon: IconConstant.icOutputDeposit,
      name: RoutesConstant.outputDeposit
  ),
  ButtonFabModel(
      icon: IconConstant.icAdd,
      name: "change",
  ),
];