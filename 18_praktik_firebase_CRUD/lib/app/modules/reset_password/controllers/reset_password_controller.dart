import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController emailC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }
}
