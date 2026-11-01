import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final db = FirebaseFirestore.instance;

  //ini untuk one time take menggunakan get() dan juga Future
  Future<QuerySnapshot<Object?>> tampilDataProduk() async {
    return await db.collection("product").get();
  }

  //ini untuk realtime menggunakan stream dan snapshots()
  Stream<QuerySnapshot<Object?>> streamDataProduk() {
    //menampilkan stream data secara descending/asc berdasarkan kolom waktu
    return db
        .collection("product")
        // .where("price", isGreaterThan: 100)
        .orderBy(
          "time",
          descending:
              true, //secara default descending false, ini untuk menampilkan data terbaru
        )
        .snapshots();

    //NOTE:untuk link dokumentasi query lebih lanjut ada disini
    // 1. basic query => https://firebase.google.com/docs/firestore/query-data/queries
    // 2. order and limit => https://firebase.google.com/docs/firestore/query-data/order-limit-data
    // 3. Query with range => https://firebase.google.com/docs/firestore/query-data/multiple-range-fields
  }

  Future<void> deleteProduct(String docId) async {
    Get.defaultDialog(
      title: "Hapus data",
      middleText: "Apakah anda yakin untuk menghapus produk ini?",
      textConfirm: "ya",
      textCancel: "Tidak",
      buttonColor: Colors.red,
      onConfirm: () async {
        try {
          Get.back(); // menutup dialog
          //ini syntax untuk hapus berdasarkan id dengan documnet reference
          await db.collection("product").doc(docId).delete();
          Get.snackbar("Berhasil", "Produk telah berhasil dihapus");
        } catch (e) {
          Get.snackbar("Gagal", "produk tidak dapat dihapus");
        }
      },
    );
  }
}
