import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/widgets/canceled_page_list.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/widgets/completed_pageList.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/widgets/history_tabs%20copy.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/widgets/upcomming_page_list.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification_view.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: pagePadding.copyWith(top: kToolbarHeight),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    FittedBox(
                      fit: BoxFit.none,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {
                              launchScreen(const NotificationView());
                            },
                            icon: const Icon(Iconsax.notification)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                StatefulBuilder(
                  builder: (context, setState) => HistoryTabItem(
                    onValueChanged: (p0) {
                      _currentIndex = p0 ?? 0;
                      pageController.jumpToPage(
                        _currentIndex,
                      );
                      setState(() {});
                    },
                    slidingIndex: _currentIndex,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: const [
                      UpCommingPageList(),
                      CompletedPageList(),
                      CanceledPageList()
                    ],
                  ),
                ),
              ],
            )));
  }
}
