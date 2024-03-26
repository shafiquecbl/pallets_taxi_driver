import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/container.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/divider.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';

class RecentShippingList extends StatelessWidget {
  const RecentShippingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: defautSpacing),
      itemBuilder: (context, index) => const ShippingWidget(
        location: "Neemuch RD. Gopalbari, Bari Sad",
        destination: "Neemuch RD. Gopalbari, Bari Sad",
        date: "12-12-2022",
        price: "Rs. 1000",
      ),
    );
  }
}

class ShippingWidget extends StatelessWidget {
  final String location;
  final String destination;
  final String date;
  final String price;
  const ShippingWidget({
    super.key,
    required this.location,
    required this.destination,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                        "Frank",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.sp),
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            color: primaryColor,
                            size: 14.sp,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("15 min",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.black54))
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(Images.alarm_error_icon),
                SizedBox(width: 10.sp),
                Column(children: [
                  Text(
                    "\$ 20",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2.sp),
                  Text("2.4 km",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black54))
                ])
              ],
            ),
            CustomDivider(padding: 20.sp),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11),
                  child: DottedVerticalLine(
                    color: borderColor,
                    gap: 3,
                    height: screenHeight * 0.1,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                          width: screenWidth * 0.05,
                          height: screenHeight * 0.04,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: primaryColor,
                          ),
                          child: Image.asset(Images.ovel_icon)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 100,
                        child: SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            destination,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.07),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                            width: screenWidth * 0.05,
                            height: screenHeight * 0.04,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(color: borderColor)),
                            child: Image.asset(Images.oval_black_icon)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 100,
                          child: SizedBox(
                            width: screenWidth * 0.5,
                            child: Text(
                              location,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            Row(
              children: [
                Expanded(
                    child: PrimaryOutlineButton(
                  text: "Decline",
                  radius: 32,
                  onPressed: () {},
                )),
                SizedBox(width: 10.sp),
                Expanded(
                  child: PrimaryButton(
                    text: "Accept",
                    radius: 32,
                    onPressed: () {},
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
