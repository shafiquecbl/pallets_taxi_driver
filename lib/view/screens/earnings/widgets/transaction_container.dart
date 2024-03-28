import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class EarningTransactionContainer extends StatelessWidget {
  final double price;
  final String title;
  final String date;
  final bool isDebt;
  final void Function()? onMoreTab;

  const EarningTransactionContainer({
    Key? key,
    required this.price,
    this.onMoreTab,
    required this.title,
    required this.date,
    required this.isDebt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pagePadding,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8.sp),
        boxShadow: boxShadow(opacity: 0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                SizedBox(height: 10.sp),
                Text(date, style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
          SizedBox(width: 10.sp),
          Wrap(
            spacing: 5.sp,
            children: [
              Text(
                "\$ $price",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              RotatedBox(
                quarterTurns: isDebt ? 0 : 2,
                child: Icon(
                  Icons.arrow_outward_rounded,
                  color: isDebt ? Colors.red : Colors.green,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
