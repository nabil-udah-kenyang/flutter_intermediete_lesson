import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  final supabase = Supabase.instance.client;

  //function untuk edit data by id, menggunakna future agar di build data nya sebelum kebuka halamanya
  Future<Map<String, dynamic>?> getDataByID(int id) async {
    final dataById = await supabase
        .from("product")
        .select()
        .eq('id', id)
        .maybeSingle();

    return dataById;
  }

  //function update data
  Future<void> updateData(int id, String nama, int harga) async {
    try {
      await supabase
          .from('product')
          .update({'name': nama, 'price': harga})
          .eq('id', id);

      Get.back();
      Get.snackbar("Berhasil", "Produk berhasil diperbarui");
    } catch (e) {
      Get.snackbar("Gagal", "Produk gagal diperbarui: $e");
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
