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
      body: FutureBuilder<Map<String, dynamic>?>(
        //tangkap argument ID dari Homeview lalu lempar ke edit controller
        future: controller.getDataByID(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //tangkap data  input field berdasarkan id yang ditangkap oleh snapshot
          var dataById = snapshot.data!;
          controller.nameC.text = dataById["name"];
          controller.priceC.text = dataById["price"].toString();

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
                    controller.updateData(
                      //jangan lupa lempar id yg ada pada arguments sebagai parameter
                      Get.arguments,
                      controller.nameC.text,
                      int.parse(controller.priceC.text),
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
