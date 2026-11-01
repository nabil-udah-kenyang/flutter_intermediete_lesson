import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('HomeView', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              //NOTE:Clip digunakan untuk memotong
              //INFO:ClipOval digunakan untuk membuat widget didalamnya memiliki radius templat FULL
              Text(
                "ClipOval",
                //NOTE:Ini cara penggunaan Google Fonts
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              ClipOval(
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.green[300],
                  child: FlutterLogo(size: 300),
                ),
              ),

              SizedBox(height: 20),

              //INFO:ClipRRect digunakan untuk mendapatkan "Border radius", alias lebi mudah di kustomisasi radiusnya
              //ClipRRect => clip radius rectangle
              Text("CliprRect", style: TextStyle(fontSize: 20)),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.green[300],
                  child: FlutterLogo(size: 300),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
