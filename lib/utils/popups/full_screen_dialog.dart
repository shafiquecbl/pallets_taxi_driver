import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenDialog {
  /// creating a dialog that will cover the entire screen

  static void showFullScreenDialog() {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
              canPop: false,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.4),
                  width: double.infinity,
                  height: double.infinity,
                  child: const CircularProgressIndicator()));
        });
  }

  static void stopFullScreenDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
