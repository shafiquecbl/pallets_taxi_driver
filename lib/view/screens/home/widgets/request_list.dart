import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/controller/request_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/helper/price_converter.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/address_widget.dart';
import 'package:pallets_taxi_driver_pannel/view/base/confirmation_dialog.dart';
import 'package:pallets_taxi_driver_pannel/view/base/divider.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';

class NewRequestList extends StatelessWidget {
  const NewRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(builder: (con) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: con.rideRequest.length,
        separatorBuilder: (context, index) => SizedBox(height: defautSpacing),
        itemBuilder: (context, index) =>
            RequestWidget(ride: con.rideRequest[index]),
      );
    });
  }
}

class RequestWidget extends StatelessWidget {
  final OnRideRequest ride;
  const RequestWidget({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defautSpacing),
        boxShadow: boxShadow(),
        color: Colors.white,
      ),
      child: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CustomNetworkImage(url: Images.user_placeholder),
                  ),
                ),
                SizedBox(width: 10.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ride.riderName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.sp),
                      Row(
                        children: [
                          Icon(Iconsax.location, size: 14.sp),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("${ride.distance} Miles",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.black54))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (ride.isUrgent) ...[
                      Image.asset(
                        Images.alarm_error_icon,
                        width: 24.sp,
                        height: 24.sp,
                      ),
                      SizedBox(height: 2.sp),
                    ],
                    Text(
                      PriceConverter.convertPrice(ride.totalAmount.toDouble()),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            CustomDivider(padding: 20.sp),
            AddressWidget(
                end: ride.dropPoints.last.address ?? '',
                start: ride.dropPoints.first.address ?? ''),
            CustomDivider(padding: 20.sp),
            Row(
              children: [
                Expanded(
                    child: PrimaryOutlineButton(
                  text: "Decline",
                  radius: 32,
                  onPressed: () {
                    showConfirmationDialog(
                        title: 'Decline Request',
                        subtitle:
                            'Are you sure you want to decline this request?',
                        actionText: 'Decline',
                        onAccept: () {
                          pop();
                          RequestsController.find
                              .rideRequestResponse(ride.id, false);
                        });
                  },
                )),
                SizedBox(width: 10.sp),
                Expanded(
                  child: PrimaryButton(
                    text: "Accept",
                    radius: 32,
                    onPressed: () {
                      showConfirmationDialog(
                          title: 'Accept Request',
                          subtitle:
                              'Are you sure you want to accept this request?',
                          actionText: 'Accept',
                          onAccept: () {
                            pop();
                            RequestsController.find
                                .rideRequestResponse(ride.id, true);
                          });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
