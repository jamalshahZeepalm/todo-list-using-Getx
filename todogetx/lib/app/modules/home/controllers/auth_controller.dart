import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/views/home_view.dart';
import 'package:todogetx/app/modules/home/views/login_screen.dart';
import 'package:todogetx/app/modules/usermodel.dart';

class AuthController extends GetxController {
  static AuthController authController = Get.find();
  late Rx<User?> user;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    ever(user, initialScreen);
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeView());
    }
  }

  Future registerUser({required UserModel userModel}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('About User', 'User message',
          titleText: Text('Account creation failed'),
          messageText: Text(e.toString()));
    }
  }

  Future SignInUser({required UserModel userModel}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('About User', 'User message',
          titleText: Text('Account Signin failed'),
          messageText: Text(e.toString()));
    }
  }

  Future signOut() async {
    auth.signOut();
  }
}
