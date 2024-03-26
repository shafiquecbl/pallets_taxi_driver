import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/responsive.dart';
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
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
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

class AnimatedTabButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function()? onTap;
  final Color? color;
  const AnimatedTabButton(
      {required this.text,
      this.onTap,
      this.selected = false,
      this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        duration: const Duration(milliseconds: 300),
        height: 40 + (ResponsiveWidget.isMobile() ? 0 : 25),
        decoration: BoxDecoration(
          color: selected ? color ?? primaryColor : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? color ?? primaryColor
                : Theme.of(context).dividerColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selected ? Colors.white : Theme.of(context).hintColor,
                ),
          ),
        ),
      ),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? fontSize;
  final bool isLeadingImage;
  final void Function()? ontab;
  final Color backgroundColor;
  final IconData? leadingIcon;
  final double? elevation;
  final double? borderRadius;

  const CustomMaterialButton(
      {super.key,
      required this.text,
      this.isLeadingImage = false,
      this.ontab,
      this.backgroundColor = primaryColor,
      this.leadingIcon,
      this.textColor = Colors.white,
      this.elevation,
      this.fontSize,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 54,
        elevation: 0,
        onPressed: ontab,
        color: backgroundColor,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingIcon != null)
              Icon(
                leadingIcon,
                color: Colors.white,
              ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: textColor, fontSize: 16),
            ),
          ],
        ));
  }
}

class CustomOutlineButton extends StatelessWidget {
  final void Function()? onTab;
  final double? borderRadius;
  final Color? borderColor;
  final Color? textColor;
  final String text;
  const CustomOutlineButton(
      {super.key,
      this.onTab,
      required this.text,
      this.borderRadius,
      this.borderColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: OutlinedButton(
        onPressed: onTab,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor ?? primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: textColor ?? primaryColor, fontSize: 16)),
      ),
    );
  }
}

class TIconBadgeButton extends StatelessWidget {
  const TIconBadgeButton(
      {super.key,
      this.icon,
      required this.count,
      this.onTap,
      this.countColor = Colors.black});

  final Icon? icon;
  final String count;
  final Color countColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: icon ?? const Icon(Iconsax.shop)),
        ),
        Positioned(
          left: 30,
          child: Container(
              alignment: Alignment.center,
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: countColor,
                shape: BoxShape.circle,
              ),
              child: FittedBox(
                child: Text(count,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Colors.white)),
              )),
        )
      ],
    );
  }
}
