import 'dart:io';

import 'package:belajar_supabase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddProductController extends GetxController {
  //Inisialisi lagi untuk supabase nya
  final supabase = Supabase.instance.client;

  late TextEditingController nameC;
  late TextEditingController priceC;

  final ImagePicker picker = ImagePicker();

  //variabel tempat dimana foto yang dipilih akan disimpan
  final Rxn<File> selectedImage = Rxn<File>();

  //fungsi untuk memilih foto
  Future<void> pickImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  Future<void> addProduct(String nama, int harga) async {
    try {
      //validasi foto terlebih dahulu
      if (selectedImage.value == null) {
        Get.snackbar("Gagal", "Silahkan masukan gambar terlebih dahulu");
        return;
      }

      String dateNow = DateTime.now().toIso8601String();
      final product = await supabase
          .from('product')
          .insert({'name': nama, 'price': harga, 'created_at': dateNow})
          .select()
          .single(); //pakai select dan single agar supabase mengembalikan data yang udah diupload

      //tampung id product yang baru dibuat
      final int productId = product['id'];

      //ambil extension dari file yang udah dipilih untuk di upload
      final extension = selectedImage.value!.path.split('.').last;

      //buat file path di storage
      final String imagePath =
          'products/$productId-${DateTime.now().millisecondsSinceEpoch}.$extension';

      //tentukan mime type
      final String? mimeType = lookupMimeType(selectedImage.value!.path);

      //upload foto ke supabase storage
      await supabase.storage
          .from('product-images')
          .upload(
            imagePath,
            selectedImage.value!,
            fileOptions: FileOptions(contentType: mimeType),
          );

      //ambil public url
      final String imageUrl = await supabase.storage
          .from('product-images')
          .getPublicUrl(imagePath);

      //update url dan path di database
      await supabase
          .from('product')
          .update({'image_url': imageUrl, 'image_path': imagePath})
          .eq('id', productId);

      Get.snackbar("Berhasil", "Produk Telah ditambahkan");
      Get.toNamed(Routes.PRODUCTS);
    } catch (e) {
      Get.snackbar("Gagal", "Produk Gagal ditambahkan");
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
