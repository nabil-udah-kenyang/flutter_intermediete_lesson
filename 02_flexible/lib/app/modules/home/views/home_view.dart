import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;

    //harus membuat appBar terpisah untuk mengetahui tinggi body dari aplikasi
    AppBar myAppBar() {
      return AppBar(
        title: Text('Flexible', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      );
    }

    //tinggi body adalah = tinggi device dikurangi tinggi appBar
    double heightBody = heightDevice - myAppBar().preferredSize.height;

    return Scaffold(
      appBar: myAppBar(),
      //maka dengan mudah kita mengetahui besar layar dan luas body dengan memanggil variabel
      body: Column(
        //sebenarnya kita juga bisa membuat seperti command dibawah tanpa MediaQuery hanya dengan widget Flexible
        //dengan menggunakan flex dia akan secara otomatis memberikan ukuran sesuai proporsi value dari "flex"
        children: [
          Flexible(flex: 7, child: Container(color: Colors.red)),
          Flexible(flex: 3, child: Container(color: Colors.amber)),
          Flexible(flex: 1, child: Container(color: Colors.green)),
        ],
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       width: widthDevice * 0.5,
      //       height: heightBody * 0.5,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       width: widthDevice * 0.5,
      //       height: heightBody * 0.3,
      //       color: Colors.amber,
      //     ),
      //     Container(
      //       width: widthDevice * 0.5,
      //       height: heightBody * 0.2,
      //       color: Colors.green,
      //     ),
      //   ],
      // ),
    );
  }
}
