import 'package:flutter/material.dart';
import 'package:spendytracking/styles/app_button.dart';
import 'package:spendytracking/styles/app_colors.dart';
import 'package:spendytracking/styles/app_image.dart';
import 'package:spendytracking/styles/app_text_style.dart';
import 'package:spendytracking/utils/constants/icon_constant.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Đăng nhập",style: AppTextStyle.titleAppBar,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: AppButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const AppImage(img: IconConstant.iconGoogle),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Đăng nhập bằng Google",
                  style: AppTextStyle.normal.copyWith(color: AppColors.white),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
