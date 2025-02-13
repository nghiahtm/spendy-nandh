import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendytracking/core/di.dart';
import 'package:spendytracking/presentation/profile/bloc/profile_bloc.dart';
import 'package:spendytracking/styles/app_button.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_text_style.dart';

import '../../../../styles/app_size_default.dart';
import '../../bloc/profile_event.dart';
import 'item_body.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizeDefault.size16),
      padding: const EdgeInsets.all(AppSizeDefault.size16),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(AppSizeDefault.size32))),
      child: Column(
        children: [
          ItemProfileSection(
            backgroundColor: AppColors.violet20,
            icon: const Icon(
              Icons.wallet,
              color: AppColors.violet100,
            ),
            title: "Account",
            onClick: () {},
          ),
          const SizedBox(
            height: AppSizeDefault.size16,
          ),
          ItemProfileSection(
            backgroundColor: AppColors.violet20,
            icon: const Icon(Icons.settings, color: AppColors.violet100),
            title: "Setting",
            onClick: () {},
          ),
          const SizedBox(
            height: AppSizeDefault.size16,
          ),
          ItemProfileSection(
            backgroundColor: AppColors.violet20,
            icon: const Icon(Icons.import_export, color: AppColors.violet100),
            title: "Account",
            onClick: () {},
          ),
          const SizedBox(
            height: AppSizeDefault.size16,
          ),
          ItemProfileSection(
            backgroundColor: AppColors.red20,
            icon: const Icon(Icons.login, color: AppColors.red100),
            title: "Logout",
            onClick: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizeDefault.size10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Logout ?",
                              style: AppTextStyle.heading4.copyWith(color: AppColors.black),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: AppSizeDefault.size10),
                              child: Text("Are you sure wanna logout?"),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    backgroundColor: AppColors.violet20,
                                    onPressed: () {},
                                    child: Text(
                                      "No",
                                      style: AppTextStyle.titleAppBar
                                          .copyWith(color: AppColors.violet100),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: AppButton(
                                    backgroundColor: AppColors.violet100,
                                    onPressed: () {
                                      kiwiContainer.resolve<ProfileBloc>().add(ProfileLogOut());
                                    },
                                    child: Text(
                                      "Yes",
                                      style: AppTextStyle.titleAppBar
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
