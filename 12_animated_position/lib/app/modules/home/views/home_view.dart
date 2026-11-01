import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      //INFO: Dengan widget position memiliki keunggulan dimana dapat memposisikan sebuah widget dengan lebih detail
      body: Center(
        child: GestureDetector(
          onTap: () => controller.selected.toggle(),
          child: Container(
            width: 300,
            height: 500,
            color: Colors.purple,
            child: Stack(
              children: [
                Obx(
                  () => AnimatedPositioned(
                    curve: Curves.easeInOutCirc,
                    top: 0,
                    right: controller.selected.isFalse ? 0 : 250,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.yellow,
                    ),
                    duration: Duration(milliseconds: 500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
