import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/helper/date_converter.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/helper/price_converter.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/ride_details/ride_details.dart';
import '../../../base/address_widget.dart';

class HistoryView extends StatelessWidget {
  final List<OnRideRequest> history;
  final bool scroll;
  const HistoryView({required this.history, this.scroll = true, super.key});

  @override
  Widget build(BuildContext context) {
    return history.isEmpty
        ? Padding(
            padding: EdgeInsets.only(
                top: scroll ? 0 : MediaQuery.sizeOf(context).height * 0.2),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.car, size: 100.sp, color: Colors.grey),
                  SizedBox(height: 20.sp),
                  Text(scroll ? 'No Shipment found' : 'No Upcoming Deliveries',
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
          )
        : ListView.separated(
            itemCount: history.length,
            padding: scroll ? pagePadding : EdgeInsets.zero,
            shrinkWrap: true,
            physics: scroll ? null : const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
                SizedBox(height: defautSpacing),
            itemBuilder: (context, index) {
              return HistoryWidget(ride: history[index]);
            },
          );
  }
}

class HistoryWidget extends StatelessWidget {
  final OnRideRequest ride;
  const HistoryWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchScreen(RideDetailScreen(ride: ride)),
      borderRadius: BorderRadius.circular(defautSpacing),
      child: Container(
        padding: pagePadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defautSpacing),
          color: Colors.white,
          boxShadow: boxShadow(opacity: 0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order #${ride.id}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                  decoration: BoxDecoration(
                    color: getShippingColor(ride.status).withOpacity(0.1),
                    border: Border.all(color: getShippingColor(ride.status)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    rideStatus(ride.status),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: getShippingColor(ride.status)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.sp),
              child: AddressWidget(
                  end: ride.dropPoints.last.address ?? '',
                  start: ride.dropPoints.first.address ?? ''),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  PriceConverter.convertPrice(ride.totalAmount.toDouble()),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(DateConverter.formatDateTime(ride.createdAt),
                    style: Theme.of(context).textTheme.bodyMedium)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Color getShippingColor(String status) {
  if (status == 'completed') {
    return Colors.green;
  } else if (status == 'canceled') {
    return Colors.red;
  } else {
    return Colors.orange;
  }
}

String rideStatus(String status) {
  if (status.contains('_')) {
    return status.split('_').map((e) => e.capitalizeFirst).join(' ');
  } else {
    return status.capitalizeFirst!;
  }
}
