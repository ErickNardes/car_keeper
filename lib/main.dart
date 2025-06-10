import 'package:car_keeper/app/core/core_bindings.dart';
import 'package:car_keeper/app/core/routes/app_pages.dart';
import 'package:car_keeper/app/features/auth/login/presenter/page/login_page.dart';
import 'package:car_keeper/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    theme: ThemeData(primaryColor: Colors.blue),
    getPages: AppPages.appPages,
    home: const LoginPage(),
    initialBinding: CoreBindings(),
  ));
}
