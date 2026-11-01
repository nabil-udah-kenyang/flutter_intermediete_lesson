import 'package:auth_firebase/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  final db = FirebaseFirestore.instance;

  //function untuk edit data by id, mengambil data
  Future<DocumentSnapshot<Object?>> getDataByID(String docID) {
    return db.collection("product").doc(docID).get();
  }

  void editProduct(String name, String harga, String? docID) async {
    try {
      await db.collection("product").doc(docID).update({
        "name": name,
        "price": int.parse(harga),
      });

      Get.snackbar("Berhasil", "Data telah di Update");
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar("Gagal", "Data tidak berhasil di Update");
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
