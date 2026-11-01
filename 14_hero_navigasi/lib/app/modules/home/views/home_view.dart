import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hero_navigasi/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Get.toNamed(Routes.PROFILE),
          //NOTE: Dengan Hero navigasi akan terasa lebih smooth seacar default
          child: Hero(
            tag: "tag1",
            child: ClipOval(
              child: Container(
                width: 200,
                height: 200,
                child: Image.network(
                  "https://picsum.photos/200/300",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
