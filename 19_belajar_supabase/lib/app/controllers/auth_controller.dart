import 'package:belajar_supabase/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> register(String email, String password) {
    return supabase.auth.signUp(email: email.trim(), password: password);
  }

  Future<AuthResponse> login(String email, String password) {
    return supabase.auth.signInWithPassword(
      email: email.trim(),
      password: password,
    );
  }

  void resetPassword(String email) async {
    //untuk cek apakah email valid atau tidak, jika valid maka akan mengirim email reset password
    if (email.isNotEmpty && GetUtils.isEmail(email)) {
      try {
        await supabase.auth.resetPasswordForEmail(email.trim());

        Get.defaultDialog(
          title: 'Berhasil',
          middleText:
              'Email reset password berhasil dikirim. Silakan cek email.',
          textConfirm: 'Baik',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      } on AuthException catch (error) {
        Get.defaultDialog(title: 'Gagal', middleText: error.message);
      } catch (error) {
        Get.defaultDialog(
          title: 'Gagal',
          middleText: 'Tidak dapat mengirim email reset password: $error',
        );
      }
    } else {
      Get.defaultDialog(title: 'Gagal', middleText: 'Email tidak valid');
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } on AuthException catch (error) {
      Get.snackbar('Logout gagal', error.message);
    }
  }
}
