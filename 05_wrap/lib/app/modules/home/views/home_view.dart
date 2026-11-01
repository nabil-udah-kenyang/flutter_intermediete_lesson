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

    AppBar myAppBar() {
      return AppBar(
        title: Text('Flexible', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      );
    }

    double heightBody = heightDevice - myAppBar().preferredSize.height;

    return Scaffold(
      appBar: myAppBar(),
      //NOTE: dengan wrap ini dapat mengatasi overflow widget dengan otomatis menurunkan widget kebawah apabila tidak ada lagi ruang di sebelah kanan
      //by Default directionya secara horizontal (kanan -> kiri), namun bisa di ubah menjadi vertikan (atas -> bawah)
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
      width: widthDevice * 0.15,
      height: 35,
      color: Colors.amber,
    );
  }
}
