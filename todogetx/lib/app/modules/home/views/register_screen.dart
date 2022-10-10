import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/app/modules/home/controllers/auth_controller.dart';
import 'package:todogetx/app/modules/home/views/login_screen.dart';
import 'package:todogetx/app/modules/usermodel.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Text(
                'Register Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: textField(controller: nameEditingController, hint: 'Name'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: textField(
                  controller: emailEditingController, hint: 'Example@.com'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: textField(
                  controller: passwordEditingController, hint: '......'),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        UserModel userModel = UserModel(
                            uid: '',
                            name: '',
                            email: emailEditingController.text,
                            password: passwordEditingController.text);
                        AuthController.authController
                            .registerUser(userModel: userModel);
                      },
                      child: Text('Login'))),
            ),
            SizedBox(
              height: 6,
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: Text("You Do have any Account then Sign in here..!"))
          ]),
    );
  }

  TextField textField(
      {required TextEditingController controller, required String hint}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Color(0xFFE4E7EB),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }
}
