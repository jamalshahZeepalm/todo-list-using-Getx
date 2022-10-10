import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/bindings/home_binding.dart';
import 'package:todogetx/app/modules/home/controllers/auth_controller.dart';
import 'package:todogetx/app/modules/home/views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      // initialRoute: AppPages.INITIAL,
      home: SplashScreen(),
      // getPages: AppPages.routes,
    ),
  );
}
