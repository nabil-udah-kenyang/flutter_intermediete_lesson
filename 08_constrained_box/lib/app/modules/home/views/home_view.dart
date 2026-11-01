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

    //INFO: Ini cara mendapatkan nilai dari tingi body aplikasi dengan GetX
    double heightBody =
        context.height - myAppBar().preferredSize.height - paddingTop;

    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        children: [
          ConstrainedBox(
            //pada ConstrainedBox kita dapat membuat aturan ukuran untuk di patuhi oleh child widget
            constraints: BoxConstraints(
              minWidth: 300,
              minHeight: 100,
              maxHeight: 150,
              maxWidth: 350,
            ),
            child: Container(
              //ukuran height/width dalam container ini tidak akan bisa kurang ataupun melewati dari min/max yang ada pada ConstrainedBox
              height: 1000,
              width: 500,
              color: Colors.red,
              child: Text(
                'Haloooo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
