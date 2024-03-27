import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/container.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/home/home.dart';

class HistoryView extends StatelessWidget {
  final ShippingStatus status;
  final List<int> history;
  const HistoryView({required this.history, required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: history.length,
      padding: pagePadding,
      separatorBuilder: (context, index) => SizedBox(height: defautSpacing),
      itemBuilder: (context, index) {
        return HistoryWidget(
          location: "Neemuch RD. Gopalbari, Bari Sad",
          destination: "Neemuch RD. Gopalbari, Bari Sad",
          status: status,
          date: "12-12-2022",
          price: "Rs. 1000",
        );
      },
    );
  }
}

class HistoryWidget extends StatelessWidget {
  final ShippingStatus status;
  final String location;
  final String destination;
  final String date;
  final String price;
  const HistoryWidget(
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
        color: Colors.white,
        boxShadow: boxShadow(opacity: 0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 4.sp),
              decoration: BoxDecoration(
                color: getShippingColor(status).withOpacity(0.3),
                border: Border.all(
                    color: getShippingColor(status).withOpacity(0.8)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                checkShippingStatus(status),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: getShippingColor(status)),
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
          ],
        ),
      ),
    );
  }

  Color getShippingColor(ShippingStatus status) {
    if (status == ShippingStatus.completed) {
      return Colors.green;
    } else if (status == ShippingStatus.upcomming) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
