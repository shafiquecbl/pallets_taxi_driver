import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/container.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class AddressWidget extends StatelessWidget {
  final String start;
  final String end;
  final bool small;
  const AddressWidget(
      {super.key, required this.end, required this.start, this.small = false});

  @override
  Widget build(BuildContext context) {
    final double fontSize = small ? 12.sp : 14.sp;
    final double spacing = small ? 15.sp : 25.sp;
    final double height = small ? 60.sp : 80.sp;
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 11.sp),
            child: DottedVerticalLine(
                color: borderColor, gap: 3.sp, height: height)),
        Column(
          children: [
            Row(
              children: [
                Container(
                    width: 22.sp,
                    height: 35.sp,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: primaryColor,
                    ),
                    child: CircleAvatar(
                        radius: 4.sp, backgroundColor: Colors.white)),
                SizedBox(width: 10.sp),
                Expanded(
                  child: Text(start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: fontSize)),
                )
              ],
            ),
            SizedBox(height: spacing),
            Row(
              children: [
                Container(
                    width: 22.sp,
                    height: 35.sp,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.white,
                        border: Border.all(color: borderColor)),
                    child: CircleAvatar(
                        radius: 4.sp, backgroundColor: Colors.black54)),
                SizedBox(width: 10.sp),
                Expanded(
                  child: Text(end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: fontSize)),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
