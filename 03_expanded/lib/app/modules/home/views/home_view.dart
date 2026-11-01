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
        children: [
          Container(
            color: Colors.red,
            width: widthDevice * 0.5,
            height: heightBody * 0.3,
          ),
          Container(
            color: Colors.amber,
            width: widthDevice * 0.5,
            height: heightBody * 0.2,
          ),
          //INFO: Penggunaan Expanded anggap saja sebagai pengambil sisa dari ukuran yang susah ditentukan
          Expanded(
            child: Container(color: Colors.green, width: widthDevice * 0.5),
          ),
        ],
      ),
    );
  }
}
