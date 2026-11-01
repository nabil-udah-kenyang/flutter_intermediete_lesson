import 'package:belajar_supabase/app/controllers/auth_controller.dart';
import 'package:belajar_supabase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final authController = Get.find<AuthController>();

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  Future<void> login() async {
    final email = emailC.text.trim();
    final password = passwordC.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password tidak boleh kosong');
      return;
    }

    try {
      final AuthResponse response = await authController.login(email, password);

      if (response.user == null || response.session == null) {
        Get.snackbar('Error', 'Login gagal. Silakan coba lagi.');
        return;
      }

      Get.snackbar('Berhasil', 'Login berhasil');
      Get.offAllNamed(Routes.HOME);
    } on AuthException catch (error) {
      Get.snackbar('Login gagal', error.message);
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
