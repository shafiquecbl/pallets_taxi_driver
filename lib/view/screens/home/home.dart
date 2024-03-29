import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/home/widgets/current_tracking.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/home/widgets/request_list.dart';
import 'widgets/stats_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text("Good Day, Jackson"),
        actions: [
          OutlinedIconButton(
            icon: Iconsax.notification,
            onTap: () => launchScreen(const NotificationScreen()),
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: ListView(
        padding: pagePadding,
        children: [
          const StatsWIdget(),

          /// Current Tracking
          const CurrentTrackingContainer(
            currentLocation: "Berlin",
            currentOrderId: "#123456789",
            status: "On the way",
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
          const NewRequestList(),
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
