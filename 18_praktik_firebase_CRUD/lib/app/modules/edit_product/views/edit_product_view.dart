import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  const EditProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit product',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        //tangkap argument ID dari Homeview lalu lempar ke edit controller
        future: controller.getDataByID(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //ubah data  input field berdasarkan id yang ditangkap oleh snapshot
          var dataById = snapshot.data!.data() as Map<String, dynamic>;
          controller.nameC.text = dataById["name"];
          controller.priceC.text = dataById["price"];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.nameC,
                  decoration: InputDecoration(
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: controller.priceC,
                  decoration: InputDecoration(
                    labelText: "Harga produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    controller.editProduct(
                      controller.nameC.text,
                      controller.priceC.text,
                      //jangan lupa lempar id yg ada pada arguments sebagai parameter
                      Get.arguments,
                    );
                  },

                  child: Text("Simpan Perubahan"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
