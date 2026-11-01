import 'package:belajar_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

//NOTE:Untuk menginisialisasi firebase sebelum aplikasi dijalankan (runApp), menggunakan tipe data Future
Future<void> main() async {
  //ini diperlukan agar memastikan lagi kalau semua , sebelum menjalankan aplikasi kita, sudah terinisialisasi dengan sempurna
  WidgetsFlutterBinding.ensureInitialized();
  //syntax untuk inisialisasi firebase dengan default settingan firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}


//Firebase cli note:
// - firebase login => untuk login ke aku firebase
// - firebae projects:list => menampilkan keseluruhan projek pada akun firebase


//step yang dilakukan :
// - dart pub global activate flutterfire_cli => untuk mengaktifkan flutterfire cli => "cukup sekali saja"
// - flutterfire configure => berfungsi untuk mengkonfigurasi secara otomatis project flutter untuk terhubung ke firebase
// - download firebase_core dari pub.dev (Pubspec yaml)
// - download package yang dibutuhkan seperti cloud_firestore dll

