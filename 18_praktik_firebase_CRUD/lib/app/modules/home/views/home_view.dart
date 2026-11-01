import 'package:auth_firebase/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auth_firebase/app/controllers/auth_controller.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authC.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      //Ini untuk One Time Get data menggunakan FutureBuilder dari firebase(Read)
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: controller.tampilDataProduk(),
      //   builder: (context, Snapshot) {
      //     //cek apakah masih loading atau udah done
      //     if (Snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     //cek apakah databse memiliki data
      //     else if (!Snapshot.hasData || Snapshot.data!.docs.isEmpty) {
      //       return Center(child: Text("Belum ada produk"));
      //     }
      //     //jika semua aman maka tampilkan data nya
      //     else {
      //       var listAllDocs = Snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: listAllDocs.length,
      //         itemBuilder: (context, index) => ListTile(
      //           title: Text("${listAllDocs[index]["name"]}"),
      //           subtitle: Text("Rp.${listAllDocs[index]["price"]}"),
      //         ),
      //       );
      //     }
      //   },
      // ),

      //Ini untuk Realtime Get Data menggunakan StreamBuilder dari firebase(Read)
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamDataProduk(),
        builder: (context, Snapshot) {
          //cek apakah masih loading atau udah done
          if (Snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //cek apakah databse memiliki data
          else if (!Snapshot.hasData || Snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Belum ada produk"));
          }
          //jika semua aman maka tampilkan data nya
          else {
            var listAllDocs = Snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                //ini digunakan untk mengambil id berdasarkan apa yang di klik
                onTap: () => Get.toNamed(
                  Routes.EDIT_PRODUCT,
                  arguments: listAllDocs[index].id,
                ),
                title: Text("${listAllDocs[index]["name"]}"),
                subtitle: Text("Rp.${listAllDocs[index]["price"]}"),
                trailing: IconButton(
                  onPressed: () =>
                      //memanggil fungsi pada controller dengan melempar id melalui argument
                      controller.deleteProduct(listAllDocs[index].id),
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          }
        },
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
