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
      body: Center(
        child: GestureDetector(
          onTap: () => controller.selected.toggle(),
          child: Obx(
            () => AnimatedContainer(
              //NOTE: Curves digunakan untuk animasi template
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(seconds: 2),
              width: controller.selected.isFalse ? 300 : 100,
              height: controller.selected.isFalse ? 300 : 100,
              color: controller.selected.isFalse
                  ? Colors.cyan
                  : Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
