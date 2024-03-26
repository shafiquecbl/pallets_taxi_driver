import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'responsive.dart';

class CustomIcon extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  final double iconSize;
  final Color? color;
  final double padding;
  final double? radius;
  final Color? iconColor;
  const CustomIcon({
    this.icon,
    this.onTap,
    this.iconSize = 20,
    this.color,
    this.padding = 10,
    this.radius,
    super.key,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: color ?? primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 32),
        ),
        child: Icon(
          icon,
          size: iconSizee,
          color: iconColor ?? Colors.white,
        ),
      ),
    );
  }

  double get iconSizee => iconSize + (ResponsiveWidget.isMobile() ? 0 : 6);
}
