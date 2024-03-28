import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Widget? icon;
  final double? radius;
  final Color? color;
  final Color? textColor;
  const PrimaryButton(
      {required this.onPressed,
      required this.text,
      this.icon,
      this.radius,
      this.color,
      this.textColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? primaryColor,
        minimumSize: Size(100.sp, 50.sp),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((radius ?? 10).sp)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, SizedBox(width: 8.sp)],
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold, color: textColor ?? Colors.white),
          ),
        ],
      ),
    );
  }
}

// outline button
class PrimaryOutlineButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Widget? icon;
  final double? radius;
  const PrimaryOutlineButton(
      {required this.onPressed,
      required this.text,
      this.icon,
      this.radius,
      super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(100.sp, 50.sp),
        side: BorderSide(color: Theme.of(context).dividerColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((radius ?? 10).sp)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, SizedBox(width: 8.sp)],
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
