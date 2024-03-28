import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class SettingTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final String? image;
  final Widget? icon;
  final Widget? trailing;
  const SettingTile(
      {super.key,
      required this.text,
      this.onTap,
      this.image,
      this.icon,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.sp),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              icon ?? Image.asset(image!),
              SizedBox(width: 10.sp),
              Expanded(
                child:
                    Text(text, style: Theme.of(context).textTheme.bodyMedium),
              ),
              trailing ?? Icon(Iconsax.arrow_right_3, size: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
