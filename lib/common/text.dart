import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageHeading extends StatelessWidget {
  final String title;
  final Widget? traling;
  final double topPadding;
  final double bottomPadding;
  const PageHeading(
      {super.key,
      required this.title,
      this.traling,
      this.topPadding = 0,
      this.bottomPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding.sp, bottom: bottomPadding.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                ),
          ),
          traling ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
