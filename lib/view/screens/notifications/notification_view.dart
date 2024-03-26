import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/widgets/notifications_list.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: kToolbarHeight * 2,
        automaticallyImplyLeading: false,
        leading: FittedBox(
          fit: BoxFit.none,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp)),
          ),
        ),
        title: Text(
          'Notification',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
          padding: pagePadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const DayNotificationList(
                      date: "today",
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
