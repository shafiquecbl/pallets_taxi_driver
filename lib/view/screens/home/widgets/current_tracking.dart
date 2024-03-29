import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/start_ride/start_ride.dart';

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
    return GetBuilder<RideController>(builder: (con) {
      RideRequest? ride = con.rideRequest;
      return ride == null
          ? const SizedBox()
          : GestureDetector(
              onTap: () => launchScreen(const RideScreen()),
              child: Container(
                  width: double.infinity,
                  padding: pagePadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defautSpacing),
                    boxShadow: boxShadow(opacity: 0.2),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: AssetImage(Images.homePageCarimage),
                        fit: BoxFit.cover),
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
                        "#${ride.id}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(height: defautSpacing),
                      Text(
                        "Destination",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(height: 2.sp),
                      Text(
                        ride.onRideRequest!.endAddress,
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
                        rideStatus(ride.onRideRequest!.status),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            );
    });
  }

  String rideStatus(String status) {
    switch (status) {
      case 'new_ride_requested':
        return 'New Ride Requested';
      case '1':
        return 'Upcomming';
      default:
        return 'Completed';
    }
  }
}
