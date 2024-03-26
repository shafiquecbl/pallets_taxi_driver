import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/widgets/history_tabs%20copy.dart';

class CompletedPageList extends StatelessWidget {
  const CompletedPageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      for (int i = 0; i < 5; i++)
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: MainDataContainer(
            location: "Neemuch RD. Gopalbari, Bari Sad",
            destination: "Neemuch RD. Gopalbari, Bari Sad",
            status: ShippingStatus.completed,
            date: "12-12-2022",
            price: "Rs. 1000",
          ),
        )
    ]);
  }
}
