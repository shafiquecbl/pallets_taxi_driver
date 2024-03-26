import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';

void showLocationDialog({required void Function()? onTab}) => showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(30.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Images.locationImage),
                  SizedBox(height: 30.sp),
                  Text(
                    "Enable Your Location",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    "Choose your location to start find the request around you",
                    style: Theme.of(context).textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  PrimaryButton(
                    text: "Use My location",
                    onPressed: onTab,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
