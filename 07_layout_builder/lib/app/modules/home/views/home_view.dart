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
      body: Container(
        width: Get.width * 0.5,
        height: heightBody * 0.3,
        color: Colors.amber,
        child: LayoutBuilder(
          builder: (context, bebas) {
            //ini digunakan untuk mengambil heigh dan width dari parrent widget alias container kuning
            double widthKuning = bebas.maxWidth;
            double heightKuning = bebas.maxHeight;
            return Stack(
              children: [
                Container(
                  //setelah itu tinggal dipanggil dan di sesuaikan ukuran nya
                  width: widthKuning * 0.5,
                  height: heightKuning * 0.5,
                  color: Colors.green,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
