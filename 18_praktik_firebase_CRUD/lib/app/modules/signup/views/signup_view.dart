import 'package:auth_firebase/app/controllers/auth_controller.dart';
import 'package:auth_firebase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text('DAFTAR', style: TextStyle(fontSize: 30)),
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
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () =>
                    authC.signup(controller.emailC.text, controller.passC.text),
                child: Text("Daftar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("sudah punya akun?"),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Login sekarang"),
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
