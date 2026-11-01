import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  //Karena main() sekarang async, Flutter perlu memastikan binding sudah siap sebelum melakukan inisialisasi plugin.
  WidgetsFlutterBinding.ensureInitialized();

  //ini untuk inisialisasi menghubungkan ke projek database supabase
  await Supabase.initialize(
    url: 'https://hzcsxyhmyeaswwvgelvr.supabase.co',
    publishableKey: 'sb_publishable_B8cwZ1cqFsktjdSaXTUheg_BWe7E7Qn',
  );

  final session = Supabase.instance.client.auth.currentSession;
  final initialRoute = session != null ? Routes.HOME : Routes.LOGIN;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController(), permanent: true);
      }),
    ),
  );
}
