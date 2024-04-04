import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/controller/dashboard_controller.dart';
import 'package:pallets_taxi_driver_pannel/helper/price_converter.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class StatsWIdget extends StatelessWidget {
  const StatsWIdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: defautSpacing),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TotalEarningButton(
              totalEarning: PriceConverter.convertPrice(10),
              onTap: () => DashboardController.find.selectedIndex = 1,
            ),
          ),
          SizedBox(width: defautSpacing),
          const Expanded(
            flex: 5,
            child: TotalRidesContainer(totalTrips: "3423"),
          )
        ],
      ),
    );
  }
}

class TotalEarningButton extends StatelessWidget {
  final String totalEarning;
  final void Function()? onTap;
  const TotalEarningButton({super.key, required this.totalEarning, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defautSpacing),
          boxShadow: boxShadow(),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipBehavior: Clip.values[1],
              clipper: HomeContainerClipper(),
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defautSpacing),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: pagePadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Earnings",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: primaryColor),
                      ),
                      const Spacer(),
                      FittedBox(
                        child: Text(
                          totalEarning,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5.sp,
              child: Container(
                width: 41,
                height: 41,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_outward_sharp,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TotalRidesContainer extends StatelessWidget {
  final String totalTrips;
  const TotalRidesContainer({super.key, required this.totalTrips});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.sp,
      padding: pagePadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defautSpacing),
        color: primaryColor,
        boxShadow: boxShadow(opacity: 0.2),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Trips",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    totalTrips,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10.sp),
                Image.asset(Images.loading_truck_icon, width: 40.sp),
              ],
            ),
          ]),
    );
  }
}

class HomeContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    return Path()
      ..moveTo(width * 0.6, 0)
      ..conicTo(width * 0.7, 0, width * 0.7, height * 0.2, 1)
      ..cubicTo(width * 0.7, height * 0.4, width * 0.7, height * 0.4,
          width * 0.9, height * 0.4)
      ..conicTo(width, height * 0.4, width, height * 0.5, 1)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
