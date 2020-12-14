import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackBar(String error) {
  Get.snackbar(
    'Error',
    error,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.red,
    backgroundColor: Colors.white,
  );
}

void showSuccessSnackBar(String message) {
  Get.snackbar(
    'Success',
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.blue,
    backgroundColor: Colors.white,
  );
}
