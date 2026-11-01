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
        child: Container(
          width: 300,
          height: 500,
          color: Colors.purple,
          child: Stack(
            children: [
              AnimatedBuilder(
                child: Container(width: 50, height: 50, color: Colors.yellow),
                animation: controller.animationC,
                builder: (context, widget) {
                  // value 0 -> 1 => convert (0 -> 1 -> 0)
                  return Positioned(
                    top: 0,
                    //ini adalah rumus untuk mengconvert dari 0 ke satu lalu kembali ke 0 (posisi)
                    right:
                        2 *
                        (0.5 - (0.5 - controller.animationC.value).abs()) *
                        250,
                    child: widget!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
