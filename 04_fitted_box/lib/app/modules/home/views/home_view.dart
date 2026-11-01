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
      body: Container(
        width: 200,
        height: 100,
        color: Colors.green,
        child: Center(
          //dengan FittedBox dia akan secara otomatis membuat ukuran dari isi konten dalam container mengecil apabila value nya menjadi overflow
          child: FittedBox(
            child: Text(
              "Haalooooooooooo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 90),
            ),
          ),
        ),
      ),
    );
  }
}
