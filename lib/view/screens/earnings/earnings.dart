import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/earnings/widgets/transaction_container.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  @override
  void initState() {
    // EarningController.find.getDriverEarnings('today');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earnings'),
        centerTitle: false,
        actions: [
          OutlinedIconButton(
            icon: Iconsax.notification,
            onTap: () => launchScreen(const NotificationScreen()),
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: ListView(
        padding: pagePadding,
        children: [
          Container(
              padding: pagePadding,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(defautSpacing),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Balance',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        SizedBox(height: 15.sp),
                        Text('\$ 10.00',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                      ]),
                  const Spacer(),
                  SizedBox(
                      height: 45.sp,
                      child: PrimaryButton(
                        text: 'Withdraw',
                        onPressed: () {},
                        color: Colors.white,
                        textColor: primaryColor,
                      ))
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            child: const PageHeading(title: "Transaction History"),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 15.sp),
            itemBuilder: (context, index) => EarningTransactionContainer(
              price: 1000,
              date: "10/10/2022",
              isDebt: index.isEven,
              title: "Bank Withdrawal",
              onMoreTab: () {},
            ),
          ),
        ],
      ),
    );
  }
}
