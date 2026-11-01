import 'package:auth_firebase/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //jika menggunakan getx maka lakuka inisiasi FirebaseAuth dengan syntax dibawah ini
  FirebaseAuth auth = FirebaseAuth.instance;

  //membuat function untuk memantau status autentikasi secara realtime dengan method authStateChanges()
  Stream<User?> AuthStatus() {
    return auth.authStateChanges();
  }

  void login(String email, String password) async {
    try {
      UserCredential myuser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //cek kembali apakah user sudah memverfikasi email, jika belum lempar eror message
      if (myuser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Gagal", "Tolong verifikasi email terlebih dahulu");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(title: "Gagal", middleText: "Maaf password salah");
      }
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential myuser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.defaultDialog(
        title: "Berhasil",
        middleText:
            "Silahkan klik link email yang telah kami kirim ke $email. harap segera di klik ",
        textConfirm: "Baik,akan saya cek",
        onConfirm: () {
          //ini untuk close dialog
          Get.back();
          Get.back();
        },
      );

      await myuser.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void ResetPassword(String email) async {
    //Ini untuk cek apakah benar sebuah email menggunaka getutils
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          middleText: "Email berhasil dikirim silahkan cek",
          title: "Berhasil",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Baik",
        );
      } catch (e) {
        Get.defaultDialog(
          middleText: "Tidak dapat mengirim email ResetPassword",
          title: "Gagal",
        );
      }
    } else {
      Get.defaultDialog(middleText: "Email Tidak valid", title: "Gagal");
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
