import 'package:auth_firebase/app/controllers/auth_controller.dart';
import 'package:auth_firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  //put controlller karna bukan controller bawaan yang sudah di binding
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    //wajib membungkus material dengan stream karna untuk pemantauan realtime
    return StreamBuilder<User?>(
      stream: authC.AuthStatus(),
      builder: (context, snapshot) {
        //cek untuk pengkondisian apakah ada sesi login, jika tidak lempar ke halaman login
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            //pada tahap routing pastikan data tidak null dan email sudah verified
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                ? Routes.HOME
                : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
