import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    //INFO : ini cara membuat adaptive layout dengan memanfaatkan orientation (potrait / landscape )
    // dengan OrientationBuilder kita dapat membuat 2 sistem layout secara bersamaan
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Home', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
              centerTitle: true,
            ),
            body: Center(
              child: Container(width: 300, height: 300, color: Colors.amber),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Home', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
              centerTitle: true,
            ),
            body: Center(
              child: Container(width: 300, height: 100, color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
