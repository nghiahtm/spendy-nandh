import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:spendytracking/styles/app_themes.dart';

import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesConstant.init,
      routes: AppRoutes.routes,
      theme: AppThemes.lightTheme(),
      builder: EasyLoading.init(),
    );
  }
}
