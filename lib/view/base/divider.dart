import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/controller/theme_controller.dart';

class CustomDivider extends StatelessWidget {
  final double padding;
  final double thickness;
  const CustomDivider({this.padding = 5, this.thickness = 1, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: GetBuilder<ThemeController>(builder: (con) {
        return Divider(
            height: 0,
            thickness: thickness,
            color: con.darkTheme ? Colors.grey[800] : Colors.grey[300]!);
      }),
    );
  }
}

class SeparaterWidget extends StatelessWidget {
  const SeparaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 10,
      color: Theme.of(context).cardColor,
    );
  }
}
