import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/address_widget.dart';
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
    return Container(
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
              Text('Order #123456',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                decoration: BoxDecoration(
                  color: getShippingColor(status).withOpacity(0.1),
                  border: Border.all(color: getShippingColor(status)),
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
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            child: AddressWidget(destination: destination, location: location),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(date, style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
        ],
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
