import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class Loading extends StatelessWidget {
  final Color? color;
  const Loading({this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 27,
        width: 27,
        child: CircularProgressIndicator(color: color ?? primaryColor),
      ),
    );
  }
}
