import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/address_widget.dart';
import 'package:pallets_taxi_driver_pannel/view/base/divider.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/chat.dart';

class RideRequestSheet extends StatelessWidget {
  final String driverName;
  final String driverImage;
  final String driveDistance;
  final String arrivalTime;
  final String totalPayment;
  final String noOfHelpers;
  final String destination;
  final String location;
  final String sizeOfBox;
  final String sizeOgBlock;
  final Function()? onAction;
  final bool endRide;
  const RideRequestSheet(
      {required this.driverName,
      required this.driverImage,
      required this.driveDistance,
      required this.arrivalTime,
      required this.totalPayment,
      required this.noOfHelpers,
      required this.destination,
      required this.location,
      required this.sizeOfBox,
      required this.sizeOgBlock,
      this.onAction,
      this.endRide = false,
      super.key});

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
                  url: driverImage,
                ),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverName,
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
                          driveDistance,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(width: 8.sp),
                        Text(
                          arrivalTime,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.sp),
              Column(
                children: [
                  Image.asset(Images.helperIcon, width: 22.sp),
                  SizedBox(height: 3.sp),
                  Text(
                    "$noOfHelpers Helpers",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(width: 8.sp),
              Column(
                children: [
                  Image.asset(Images.sizeIcon, width: 22.sp),
                  SizedBox(height: 3.sp),
                  Text(
                    sizeOfBox,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(width: 8.sp),
              Column(
                children: [
                  Image.asset(Images.weightIcon, width: 22.sp),
                  SizedBox(height: 3.sp),
                  Text(
                    sizeOgBlock,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          ),

          CustomDivider(padding: 20.sp),

          Row(
            children: [
              Expanded(
                child: AddressWidget(
                  destination: destination,
                  location: location,
                  small: true,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Column(
                  children: [
                    const Icon(Icons.info_outline),
                    SizedBox(height: 3.sp),
                    Text("Instruction",
                        style: Theme.of(context).textTheme.bodySmall)
                  ],
                ),
                padding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
              ),
            ],
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
                "Rs. $totalPayment",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),

          SizedBox(height: 30.sp),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (endRide) ...[
                CustomCircledIconButton(
                  icon: Icons.phone,
                  onTap: () {},
                ),
                SizedBox(width: 10.sp),
              ],
              CustomCircledIconButton(
                icon: Iconsax.message5,
                onTap: () => launchScreen(const ChatScreen()),
              ),
              SizedBox(width: 15.sp),
              Expanded(
                child: PrimaryButton(
                  text: endRide ? "End Ride" : "Start Ride",
                  onPressed: () {
                    onAction?.call();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
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

// Column(
//                       children: [
//                         Image.asset(Images.labourar_icon, width: 24.sp),
//                         Text(
//                           "$noOfHelpers Helpers",
//                           style: Theme.of(context).textTheme.labelSmall,
//                         )
//                       ],
//                     ),
//                     SizedBox(width: 10.sp),
//                     Column(
//                       children: [
//                         Image.asset(Images.box_image, width: 24.sp),
//                         Text(
//                           sizeOfBox,
//                           style: Theme.of(context).textTheme.labelSmall,
//                         )
//                       ],
//                     ),
//                     SizedBox(width: 10.sp),
//                     Column(
//                       children: [
//                         Image.asset(Images.box_icon, width: 24.sp),
//                         Text(sizeOgBlock,
//                             style: Theme.of(context).textTheme.labelSmall)
//                       ],
//                     ),