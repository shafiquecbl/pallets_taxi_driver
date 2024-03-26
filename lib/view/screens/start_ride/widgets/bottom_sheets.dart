import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/container.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

void showDriverInformationBottomSheet({
  required String driverName,
  required String driverImage,
  required String driveDistance,
  required String arrivalTime,
  required String totalPayment,
  required String noOfHelpers,
  required String destination,
  required String location,
  required String sizeOfBox,
  required String sizeOgBlock,
  bool allowChatandCallButton = false,
  void Function()? startRideTab,
  void Function()? endRideTab,
  void Function()? onCallTab,
  void Function()? onMessageTab,
}) {
  showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    context: Get.overlayContext!,
    builder: (BuildContext context) {
      return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: pagePadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Your driver is coming in $arrivalTime",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CustomNetworkImage(
                        height: 60,
                        width: 60,
                        url: driverImage,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driverName,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(children: [
                          Icon(
                            Icons.location_on,
                            size: 12,
                          ),
                          Text(driveDistance,
                              style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(
                            width: 10,
                          ),
                          Text(arrivalTime,
                              style: Theme.of(context).textTheme.bodySmall)
                        ]),
                      ],
                    ),
                  ]),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Images.box_icon),
                          Text(
                            "$noOfHelpers Helpers",
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Images.box_image),
                          Text(
                            sizeOfBox,
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Images.labourar_icon),
                          Text(sizeOgBlock,
                              style: Theme.of(context).textTheme.labelSmall)
                        ],
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 30,
              ),

              /// location and destination
              ///

              const Divider(
                color: borderColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 11),
                        child: DottedVerticalLine(
                          color: borderColor,
                          gap: 1,
                          height: 70,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              width: 22,
                              height: 30,
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: primaryColor,
                              ),
                              child: Image.asset(Images.ovel_icon)),
                          const SizedBox(
                            width: 10,
                          ),
                          FittedBox(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.62,
                              height: 25,
                              child: Text(
                                destination,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: borderColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: Row(
                          children: [
                            Container(
                                width: 22,
                                height: 30,
                                alignment: Alignment.topCenter,
                                padding: const EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all(color: borderColor)),
                                child: Image.asset(Images.oval_black_icon)),
                            const SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.62,
                                height: 25,
                                child: Text(
                                  location,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: borderColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// instructions
                  ///

                  Column(children: [
                    Image.asset(Images.circled_exclamation_icon),
                    Text("Instructions",
                        style: Theme.of(context).textTheme.labelSmall)
                  ]),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Divider(
                color: borderColor,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: endRideTab,
                      child: Text(
                        "Total Payment:",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.black54),
                      )),
                  Row(
                    children: [
                      Image.asset(Images.alarm_error_icon),
                      Text(
                        "$totalPayment/",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        driveDistance,
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),

              /// contact driver
              ///
              allowChatandCallButton
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CustomCircledIconButton(
                                icon: Icons.phone,
                                onTap: onCallTab,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomCircledIconButton(
                                icon: Iconsax.message5,
                                onTap: onMessageTab,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: CustomMaterialButton(
                                text: "End Ride", ontab: endRideTab)),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: primaryColor),
                          ),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(Images.chatIcon),
                            ),
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CustomMaterialButton(
                            text: "Start Ride",
                            ontab: startRideTab,
                          ),
                        ),
                      ],
                    )
            ]),
          ));
    },
  );
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
