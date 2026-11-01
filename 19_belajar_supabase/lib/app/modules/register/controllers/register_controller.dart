import 'package:belajar_supabase/app/controllers/auth_controller.dart';
import 'package:belajar_supabase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  final authController = Get.find<AuthController>();

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<void> register() async {
    final email = emailC.text.trim();
    final password = passwordC.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan Password tidak boleh kosong');
      return;
    }
    try {
      final AuthResponse response = await authController.register(
        email,
        password,
      );
      final user = response.user;
      final session = response.session;

      if (user == null) {
        Get.snackbar('Error', 'Registrasi gagal. Silakan coba lagi.');
        return;
      }

      if (session == null) {
        Get.snackbar(
          'Berhasil',
          'Akun dibuat. Silakan cek email untuk verifikasi.',
        );
        Get.offAllNamed(Routes.LOGIN);
        return;
      }

      Get.snackbar('Berhasil', 'Akun berhasil dibuat');

      Get.offAllNamed(Routes.HOME);
    } on AuthException catch (error) {
      Get.snackbar('Registrasi gagal', error.message);
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
