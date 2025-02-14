import 'package:flutter/material.dart';
import 'package:spendytracking/styles/app_size_default.dart';
import 'package:spendytracking/styles/app_text_style.dart';

class ItemProfileSection extends StatelessWidget {
  final Color backgroundColor;
  final Icon icon;
  final String title;
  final Function() onClick;

  const ItemProfileSection(
      {super.key,
      required this.backgroundColor,
      required this.icon,
      required this.title,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizeDefault.size10),
            decoration:  BoxDecoration(
                color: backgroundColor,
                borderRadius:const BorderRadius.all(Radius.circular(AppSizeDefault.size16))),
            child: icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(title,style:AppTextStyle.titleAppBar,)
        ],
      ),
    );
  }
}
