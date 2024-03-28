import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/controller/history_controller.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/widgets/history_tabs.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/widgets/history_view.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: false,
        actions: [
          OutlinedIconButton(
            icon: Iconsax.notification,
            onTap: () => launchScreen(const NotificationScreen()),
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: GetBuilder<HistoryController>(
        builder: (con) {
          return Column(
            children: [
              HistoryTabItem(
                onValueChanged: () {
                  pageController.animateToPage(
                    con.currentIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    con.currentIndex = index;
                  },
                  children: [
                    HistoryView(
                      history: List.generate(5, (index) => index).toList(),
                      status: ShippingStatus.upcomming,
                    ),
                    HistoryView(
                      history: List.generate(5, (index) => index).toList(),
                      status: ShippingStatus.completed,
                    ),
                    HistoryView(
                      history: List.generate(5, (index) => index).toList(),
                      status: ShippingStatus.cenceled,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
