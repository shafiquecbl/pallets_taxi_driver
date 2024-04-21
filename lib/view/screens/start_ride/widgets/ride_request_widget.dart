import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/helper/date_converter.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/helper/price_converter.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/address_widget.dart';
import 'package:pallets_taxi_driver_pannel/view/base/confirmation_dialog.dart';
import 'package:pallets_taxi_driver_pannel/view/base/divider.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/chat.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/review/review.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'otp_dialog.dart';

class RideRequestSheet extends StatelessWidget {
  final OnRideRequest ride;
  const RideRequestSheet({required this.ride, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pagePadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
        boxShadow: boxShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 50.sp,
              height: 5.sp,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
          ),
          SizedBox(height: 20.sp),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.sp),
                child: CustomNetworkImage(
                  height: 55,
                  width: 55,
                  url: ride.riderProfileImage,
                ),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ride.riderName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3.sp),
                    Row(
                      children: [
                        Icon(Iconsax.location5, size: 13.sp),
                        Text(
                          '800 m',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(width: 8.sp),
                        Text(
                          '(5 min)',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          CustomDivider(padding: 20.sp),
          AddressWidget(
            end: ride.endAddress,
            start: ride.startAddress,
            small: true,
          ),
          CustomDivider(padding: 20.sp),
          Row(
            children: [
              Text(
                "Total Payment:",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.black54),
              ),
              const Spacer(),
              Text(
                PriceConverter.convertPrice(ride.totalAmount.toDouble()),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          SizedBox(height: 20.sp),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCircledIconButton(
                icon: Icons.phone,
                onTap: () {
                  launchUrlString('tel:${ride.riderContactNumber}');
                },
              ),
              SizedBox(width: 10.sp),
              CustomCircledIconButton(
                icon: Iconsax.message5,
                onTap: () => launchScreen(const ChatScreen()),
              ),
              SizedBox(width: 15.sp),
              Expanded(
                child: PrimaryButton(
                  text: ride.status == 'accepted'
                      ? "Start Ride"
                      : ride.status == 'arriving'
                          ? "Arrived"
                          : ride.status == 'arrived'
                              ? "Start Ride"
                              : "End Ride",
                  onPressed: _updateStatus,
                ),
              ),
            ],
          ),
          // info (helpers, size, weight)
          const PageHeading(title: 'Info', topPadding: 30, bottomPadding: 10),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(Images.helperIcon, width: 30.sp),
                  SizedBox(height: 5.sp),
                  Text(
                    "${ride.helpers} Helpers",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(width: 30.sp),
              Column(
                children: [
                  Image.asset(Images.sizeIcon, width: 30.sp),
                  SizedBox(height: 5.sp),
                  Text(
                    ride.dimensions,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(width: 30.sp),
              Column(
                children: [
                  Image.asset(Images.weightIcon, width: 30.sp),
                  SizedBox(height: 5.sp),
                  Text(
                    ride.weight,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),

          // Duration
          const PageHeading(
              title: 'Duration', topPadding: 30, bottomPadding: 10),
          Text(
            "${DateConverter.formatDate(ride.startDate)}  -  ${DateConverter.formatDate(ride.endDate)}",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          // Equipment
          const PageHeading(
              title: 'Equipment', topPadding: 30, bottomPadding: 10),
          Text(
            ride.equipments,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  _updateStatus() {
    String title = '';
    String subtitle = '';
    String actionText = '';
    String status = '';
    if (ride.status == 'accepted') {
      title = 'Start Ride';
      subtitle = 'Are you sure you want to start the ride?';
      actionText = 'Start Ride';
      status = 'arriving';
    } else if (ride.status == 'arriving') {
      title = 'Arrived';
      subtitle = 'Are you sure you have arrived at the location?';
      actionText = 'Arrived';
      status = 'arrived';
    } else {
      title = 'End Ride';
      subtitle = 'Are you sure you want to end the ride?';
      actionText = 'End Ride';
      status = 'completed';
    }
    if (ride.status == 'arrived') {
      showOTPDialog(onAccept: (otp) {
        pop();
        RideController.find.rideRequestUpdate('in_progress', otp: otp);
      });
    } else {
      showConfirmationDialog(
        title: title,
        subtitle: subtitle,
        actionText: actionText,
        onAccept: () {
          pop();
          if (status == 'completed') {
            RideController.find.completeRideRequest().then((value) {
              if (value.isSuccess) {
                pop();
                launchScreen(RatingScreen(ride: ride));
              }
            });
          } else {
            RideController.find.rideRequestUpdate(status);
          }
        },
      );
    }
  }
}

class CustomCircledIconButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  const CustomCircledIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: primaryColor),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            icon,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
