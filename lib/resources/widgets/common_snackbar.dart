import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/resources/styles/typograph.dart';

class CommonSnackbar {
  static void showErrorSnackbar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: StyleTypograph.body1.bold.copyWith(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: StyleTypograph.body3.regular.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static void showInfoSnackbar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: StyleTypograph.body1.bold.copyWith(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: StyleTypograph.body3.regular.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: Durations.extralong3,
    );
  }

  static void showSuccessSnackbar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: StyleTypograph.body1.bold.copyWith(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: StyleTypograph.body3.regular.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  static void showCustomSnackbar(BuildContext context, String title,
      String message, Color backgroundColor) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: StyleTypograph.body1.bold.copyWith(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: StyleTypograph.body3.regular.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }
}
