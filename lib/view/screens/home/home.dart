import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification_view.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/start_ride/start_ride_view.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/home/widgets/current_tracking.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/home/widgets/recent_shipping.dart';
import 'widgets/stats_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: kToolbarHeight * 1.5.sp,
        title: const Text("Good Day, Jackson"),
        actions: [
          IconButton(
            onPressed: () {
              launchScreen(const NotificationView());
            },
            icon: const Icon(Iconsax.notification),
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
              side: const BorderSide(color: borderColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: ListView(
        padding: pagePadding,
        children: [
          const StatsWIdget(),

          /// Current Tracking
          CurrentTrackingContainer(
            currentLocation: "Berlin",
            currentOrderId: "#123456789",
            status: "On the way",
            onTap: () {
              launchScreen(const StartRideView());
            },
          ),

          SizedBox(height: defautSpacing),

          PageHeading(
            title: "New Requests",
            traling: TextButton(
              onPressed: () {},
              child: Text("View all",
                  style: Theme.of(context).textTheme.bodyMedium!),
            ),
          ),

          /// Recent Shipping List
          const RecentShippingList(),
        ],
      ),
    );
  }
}

String checkShippingStatus(ShippingStatus status) {
  if (status == ShippingStatus.upcomming) {
    return "Upcomming";
  } else if (status == ShippingStatus.completed) {
    return "Completed";
  } else {
    return "Canceled";
  }
}
