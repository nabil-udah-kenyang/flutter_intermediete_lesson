import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hero_navigasi/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
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
          onTap: () => Get.toNamed(Routes.HOME),
          child: Hero(
            tag: "tag1",
            child: ClipOval(
              child: Container(
                width: 350,
                height: 350,
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
