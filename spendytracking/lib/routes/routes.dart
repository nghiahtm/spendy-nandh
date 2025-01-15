import 'package:flutter/material.dart';
import 'package:spendytracking/presentation/splash/splash_page.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    "/": (_) => const SplashPage()
  };
}