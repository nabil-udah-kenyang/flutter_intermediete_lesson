import 'package:belajar_supabase/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'ProductsView',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Center(
        // Menggunakan StreamBuilder untuk mendengarkan perubahan data dari Stream
        child: StreamBuilder(
          // Stream digunakan untuk menerima data yang dapat berubah secara realtime
          stream: controller.TampilDataProduk(),
          // Builder digunakan untuk membangun UI berdasarkan kondisi dan data dari Stream
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            // Mengambil data dari AsyncSnapshot yang berasal dari Stream
            final products = asyncSnapshot.data ?? [];

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  onTap: () => Get.toNamed(
                    Routes.EDIT_PRODUCT,
                    //NOTE: wajib mengirim argument ketika pindah ke halaman edit dengan arguments
                    arguments: product['id'],
                  ),

                  //foto Produk
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: product['image_url'] != null
                        ? Image.network(
                            product['image_url'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image);
                            },
                          )
                        : const Icon(Icons.image),
                  ),
                  title: Text(product["name"]),
                  subtitle: Text("Rp.${product['price'].toString()}"),
                  trailing: IconButton(
                    //kirim index dengan paramater primary key table
                    onPressed: () => controller.deleteProduk(product['id']),
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          },
        ),
      ),

      //ini tombol untuk menambah data ke firebase
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        tooltip: "Tambah Data",
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
    );
  }
}
