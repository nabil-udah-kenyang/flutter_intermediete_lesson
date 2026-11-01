import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationC = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2),
  )..repeat();
}
