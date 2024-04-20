import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/style.dart';

class ReceiptTile extends StatelessWidget {
  final String title;
  final String value;
  final bool total;
  const ReceiptTile(
      {required this.title,
      required this.value,
      this.total = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: defautSpacing),
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: total ? 20.sp : 14.sp,
                      ))),
          Text(value,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: total ? 20.sp : 14.sp,
                  ))
        ],
      ),
    );
  }
}
