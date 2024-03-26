import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/container.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/home/home.dart';

class HistoryTabItem extends StatelessWidget {
  final int slidingIndex;
  final void Function(int?) onValueChanged;

  const HistoryTabItem({
    Key? key,
    required this.slidingIndex,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceOut,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: CupertinoSlidingSegmentedControl(
        children: {
          0: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: screenHeight * 0.05,
              child: Center(
                child: Text("UpComming",
                    style: TextStyle(
                      color: slidingIndex == 0 ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    )),
              ),
            ),
          ),
          1: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: screenHeight * 0.05,
              child: Center(
                child: Text("Completed",
                    style: TextStyle(
                      color: slidingIndex == 1 ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    )),
              ),
            ),
          ),
          2: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: screenHeight * 0.05,
              child: Center(
                child: Text("Cancelled",
                    style: TextStyle(
                      color: slidingIndex == 2 ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    )),
              ),
            ),
          )
        },
        thumbColor: primaryColor,
        backgroundColor: Colors.white,
        groupValue: slidingIndex,
        onValueChanged: onValueChanged,
      ),
    );
  }
}

class MainDataContainer extends StatelessWidget {
  final ShippingStatus status;
  final String location;
  final String destination;
  final String date;
  final String price;
  const MainDataContainer(
      {super.key,
      required this.status,
      required this.location,
      required this.destination,
      required this.date,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: status == ShippingStatus.completed
                    ? Colors.green.withOpacity(0.3)
                    : ShippingStatus.upcomming == status
                        ? Colors.orange.withOpacity(0.3)
                        : Colors.red.withOpacity(0.3),
                border: Border.all(
                    color: status == ShippingStatus.completed
                        ? Colors.green.withOpacity(0.8)
                        : ShippingStatus.upcomming == status
                            ? Colors.orange.withOpacity(0.8)
                            : Colors.red.withOpacity(0.8)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  checkShippingStatus(status),
                  style: const TextStyle().copyWith(
                      color: status == ShippingStatus.completed
                          ? Colors.green
                          : ShippingStatus.upcomming == status
                              ? Colors.orange
                              : Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ $price",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(date)
              ],
            ),
          ])),
    );
  }
}
