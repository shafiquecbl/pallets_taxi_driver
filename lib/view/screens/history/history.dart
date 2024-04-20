import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/controller/history_controller.dart';
import 'widgets/history_tabs.dart';
import 'widgets/history_view.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      HistoryController.find.currentIndex = 0;
    });
    HistoryController.find.getRideHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: false,
        actions: [
          OutlinedIconButton(
            icon: Iconsax.notification,
            onTap: () {},
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: GetBuilder<HistoryController>(
        builder: (con) {
          final rides = con.rideHistory;
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
                child: con.loading
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : PageView(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          con.currentIndex = index;
                        },
                        children: [
                          HistoryView(
                            history: rides
                                .where((e) => e.status == 'completed')
                                .toList(),
                            scroll: true,
                          ),
                          HistoryView(
                            history: rides
                                .where((e) => e.status == 'canceled')
                                .toList(),
                            scroll: true,
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
