import 'package:auth_firebase/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  final db = FirebaseFirestore.instance;

  void addProduct(String name, String harga) async {
    try {
      //makai date untuk nantinya bisa enggunaka order by time
      String DateNow = DateTime.now().toIso8601String();
      await db.collection("product").add({
        "name": name,
        "price": int.parse(harga),
        "time": DateNow,
      });

      Get.snackbar("Berhasil", "Data telah ditambahkan");
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Gagal", "Data tidak berhasil ditambahkan");
    }
  }

  // on init dan juga on close dibuat utuk mencegah kebocoran text controller

  @override
  void onInit() {
    // TODO: implement onInit
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
