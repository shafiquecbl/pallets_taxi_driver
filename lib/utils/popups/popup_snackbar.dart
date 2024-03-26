import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class TSnackBar {
  /// success
  static void showSuccessSnackBar(
      {required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Iconsax.check,
        color: Colors.white,
      ),
      margin: pagePadding,
    );
  }

  /// warning
  static void showWarningSnackBar(
      {required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Iconsax.warning_2,
        color: Colors.white,
      ),
      margin: pagePadding,
    );
  }

  /// error
  static void showErrorSnackBar({required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade800,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Iconsax.warning_2,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(20),
    );
  }
}
