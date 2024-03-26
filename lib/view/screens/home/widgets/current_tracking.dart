import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class CurrentTrackingContainer extends StatelessWidget {
  final String currentOrderId;
  final String currentLocation;
  final String status;
  final void Function()? onTap;
  const CurrentTrackingContainer(
      {super.key,
      required this.currentOrderId,
      required this.currentLocation,
      required this.status,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          padding: pagePadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defautSpacing),
            boxShadow: boxShadow(opacity: 0.2),
            color: Colors.white,
            image: const DecorationImage(
                image: AssetImage(Images.homePageCarimage), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Tracking",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black),
              ),
              SizedBox(height: 5.sp),
              Text(
                currentOrderId,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: primaryColor),
              ),
              SizedBox(height: defautSpacing),
              Text(
                "Current Location",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: primaryColor),
              ),
              SizedBox(height: 2.sp),
              Text(
                currentLocation,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: defautSpacing),
              Text(
                "Status",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: primaryColor),
              ),
              SizedBox(height: 2.sp),
              Text(
                status,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
