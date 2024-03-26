import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function()? onTap;
  const CustomChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: selected ? primaryColor : reciveMessagebackColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}
