import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonSnackbar {
  static void showErrorSnackbar(
    BuildContext context,
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static void showInfoSnackbar(
    BuildContext context,
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  static void showSuccessSnackbar(
    BuildContext context,
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  static void showCustomSnackbar(BuildContext context, String title,
      String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }
}
