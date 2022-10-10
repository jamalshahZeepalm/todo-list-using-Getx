import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/views/home_view.dart';
import 'package:todogetx/app/modules/home/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // FirebaseAuth auth = FirebaseAuth.instance;
    // String user = auth.currentUser!.uid;

    // if (user == null) {
    //   3.seconds.delay().then((value) => Get.off(() => LoginScreen()));
    // } else {
    //   3.seconds.delay().then((value) => Get.off(() => HomeView()));
    // }

    3.seconds.delay().then((value) => Get.off(() => LoginScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.lightBlueAccent[50],
        child: Container(
          width: 100,
          height: 100,
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
