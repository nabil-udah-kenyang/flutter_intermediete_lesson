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
      //NOTE: sama aja kayak container animted hanya ini untuk posisi
      body: Center(
        child: GestureDetector(
          onTap: () => controller.selected.toggle(),
          child: Obx(
            () => Container(
              alignment: Alignment.center,
              width: 300,
              height: 300,
              color: Colors.cyan,
              child: AnimatedAlign(
                duration: Duration(seconds: 1),
                curve: Curves.easeOutCirc,
                child: Text("Halo"),
                alignment: controller.selected.isFalse
                    ? Alignment.topLeft
                    : Alignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
