import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spendytracking/styles/app_loading.dart';

import 'core/di.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupContainer();
  runApp(const MyApp());
  AppLoading.configLoading();
}
