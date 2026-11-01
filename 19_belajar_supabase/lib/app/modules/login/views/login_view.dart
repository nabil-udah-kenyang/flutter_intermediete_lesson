import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: controller.emailC,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text('email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: controller.passwordC,
              decoration: InputDecoration(
                label: Text('password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                controller.login();
              },
              child: const Text('Login'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.RESET_PASSWORD);
              },
              child: const Text('Lupa password?'),
            ),

            RichText(
              text: TextSpan(
                text: "Belum punya akun? ",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Daftar',
                    recognizer: TapGestureRecognizer()
                      //..onTap = langsung mengatur properti objek menggunakan cascade.
                      ..onTap = () {
                        Get.toNamed(Routes.REGISTER);
                      },
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
