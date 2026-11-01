import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductsController extends GetxController {
  //inisialisasi client terlebih dahulu, tampung dalam variabel
  final supabase = Supabase.instance.client;

  //gunakan stream untuk realtime database dengan memantau stream(primaryKey: ['id'])
  //dipanatu id karena Supabase perlu tahu primary key tabel product untuk melacak perubahan baris.
  Stream<List<Map<String, dynamic>>> TampilDataProduk() {
    final data = supabase.from('product').stream(primaryKey: ['id']);
    //cukup return variabelnya
    return data;
  }

  //fungsi delet product
  //tampung paramatere id yng dikirim dari view
  Future<void> deleteProduk(int id) async {
    Get.defaultDialog(
      middleText: "Yakin Ingin menghapus produk ini?",
      title: "Hapus Produk",
      textConfirm: "Ya",
      textCancel: "Tidak",
      buttonColor: Colors.red,
      onConfirm: () async {
        try {
          Get.back();
          //sytax dasar delete row
          // await supabase.from('product').delete().eq('id', id);
          //pastikan untuk mengaktifkan policies RlS di supabase
          // 1. Ambil data product berdasarkan ID
          final product = await supabase
              .from('product')
              .select('image_path')
              .eq('id', id)
              .maybeSingle();

          // 2. Kalau product mempunyai foto,
          // hapus foto tersebut dari Storage
          if (product != null && product['image_path'] != null) {
            await supabase.storage.from('product-images').remove([
              product['image_path'],
            ]);
          }

          // 3. Hapus product dari database
          await supabase.from('product').delete().eq('id', id);

          Get.snackbar("Berhasil", "Produk telah berhasil dihapus");
        } catch (e) {
          Get.snackbar("Gagal", "Produk tidak bisa dihapus: $e");
        }
      },
    );
  }
}
