import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/divider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          'Notification',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => CustomDivider(padding: 15.sp),
        padding: pagePadding,
        itemBuilder: (context, index) {
          return const NotificationWidget(
            text: "Check out is successful , you can now receive the product",
            imageAddress: Images.payment_successful,
          );
        },
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final String text;
  final String imageAddress;
  const NotificationWidget(
      {super.key, required this.text, required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: primaryColor,
          radius: 24.sp,
          child: Image.asset(imageAddress, width: 24.sp),
        ),
        SizedBox(width: 10.sp),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Successful',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 5.sp),
              Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
