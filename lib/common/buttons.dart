import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      child: IconButton(
        onPressed: pop,
        icon: Icon(Icons.arrow_back_ios_new_sharp, size: 20.sp),
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          side: const BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
    );
  }
}

class OutlinedIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const OutlinedIconButton(
      {required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        side: const BorderSide(color: borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
      ),
    );
  }
}
