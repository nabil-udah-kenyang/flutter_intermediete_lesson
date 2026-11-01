import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    //INFO: Membuat container dengan ukuran fleksibel berdasarkan lebar piksel device yang berbeda beda(Responsif)
    //MediaQuery digunakan untuk mengetahui ukuran height / width dari device nya
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    //MediaQuery juga bisa dipakai untuk mengambil padding atas/bawah kanan/kiri dan banyak lainya
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: paddingTop),
        height: heightDevice,
        width: widthDevice / 2,
        color: Colors.red,
      ),
    );
  }
}
