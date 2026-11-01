import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  //NOTE: Penggunaan Getx sebagai pengganti dari MEDIAQUERY
  double widthDevice = Get.width;
  double heightDevice = Get.height;

  @override
  Widget build(BuildContext context) {
    //NOTE: Ini juga untuk mendapatkan padding
    double paddingTop = context.mediaQueryPadding.top;
    double paddingBottom = context.mediaQueryPadding.bottom;
    AppBar myAppBar() {
      return AppBar(
        title: Text('Flexible', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      );
    }

    return Scaffold(
      appBar: myAppBar(),
      body: Wrap(
        //gunakan ini untuk mengubah direction(arah)
        // direction: Axis.vertical,
        children: [
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
          KotakKuning(widthDevice: widthDevice),
        ],
      ),
    );
  }
}

class KotakKuning extends StatelessWidget {
  const KotakKuning({super.key, required this.widthDevice});

  final double widthDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: Get.width * 0.15,
      height: 35,
      color: Colors.amber,
    );
  }
}
