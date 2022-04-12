import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successToast(String title, String message){
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      colorText: Colors.white);
}

void errorSnackbar(String title, String message){
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      colorText: Colors.white);
}