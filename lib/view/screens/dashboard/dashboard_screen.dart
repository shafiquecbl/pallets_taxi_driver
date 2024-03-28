import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/controller/dashboard_controller.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/earnings/earnings.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/history/history.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/home/home.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/settings/settings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const EarningScreen(),
    const HistoryScreen(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (con) {
      int currentIndex = con.selectedIndex;
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _screens[currentIndex],
        ),
        bottomNavigationBar: Container(
          height: 75.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.sp),
              topRight: Radius.circular(30.sp),
            ),
            color: Colors.white,
            boxShadow: boxShadow(opacity: 0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavButton(
                  text: "Home",
                  icon: Iconsax.home,
                  selected: currentIndex == 0,
                  onPressed: () => con.selectedIndex = 0,
                ),
                NavButton(
                  text: "Earnings",
                  icon: Iconsax.wallet_1,
                  selected: currentIndex == 1,
                  onPressed: () => con.selectedIndex = 1,
                ),
                NavButton(
                  text: "History",
                  icon: Iconsax.task,
                  selected: currentIndex == 2,
                  onPressed: () => con.selectedIndex = 2,
                ),
                NavButton(
                  text: "Settings",
                  icon: Iconsax.setting,
                  selected: currentIndex == 3,
                  onPressed: () => con.selectedIndex = 3,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  const NavButton({
    super.key,
    required this.text,
    required this.icon,
    this.selected = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: selected ? primaryColor : Colors.black54),
          SizedBox(height: 3.sp),
          Text(
            text,
            style: const TextStyle()
                .copyWith(color: selected ? primaryColor : Colors.black54),
          )
        ],
      ),
    );
  }
}
