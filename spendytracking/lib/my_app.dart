import 'package:flutter/material.dart';
import 'package:spendytracking/styles/app_themes.dart';

import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: AppRoutes.routes,
      theme: AppThemes.lightTheme(),
    );
  }
}
