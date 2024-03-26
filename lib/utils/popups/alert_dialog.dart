import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';

class TDialogs {
  static void showWarningDialog({
    required String title,
    required String message,
    required void Function() onOK,
    bool allowCancel = false,
  }) {
    showDialog(
        context: Get.overlayContext!,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white)),
              iconColor: Colors.red,
              icon: const Icon(Icons.warning),
              content: Text(message),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                ElevatedButton(
                  onPressed: onOK,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primaryColor),
                  ),
                  child:
                      const Text('OK', style: TextStyle(color: Colors.white)),
                ),
              ]);
        });
  }
}

void showSuccessPopup({
  required String title,
  required String message,
}) {
  showDialog(
    context: Get.overlayContext!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 280,
            width: 360,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              SizedBox(height: 10),
              Image.asset(Images.success_icon),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(title,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(message,
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              ),
            ]),
          ),
        ),
      );
    },
  );

  Future.delayed(const Duration(seconds: 3), () {
    Navigator.of(Get.overlayContext!).pop();
  });
}
