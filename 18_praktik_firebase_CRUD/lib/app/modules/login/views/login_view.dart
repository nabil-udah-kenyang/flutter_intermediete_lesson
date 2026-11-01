import 'package:auth_firebase/app/controllers/auth_controller.dart';
import 'package:auth_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text('LOGIN', style: TextStyle(fontSize: 30)),
              SizedBox(height: 30),
              TextField(
                controller: controller.emailC,
                decoration: InputDecoration(
                  label: Text("email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: controller.passC,
                decoration: InputDecoration(
                  label: Text("password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.RESET_PASSWORD);
                  },
                  child: Text("Lupa password?"),
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    authC.login(controller.emailC.text, controller.passC.text),
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun?"),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.SIGNUP);
                    },
                    child: Text("Daftar sekarang"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
