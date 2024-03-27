import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/controller/history_controller.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class HistoryTabItem extends StatelessWidget {
  final Function() onValueChanged;
  const HistoryTabItem({required this.onValueChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (con) {
      return AnimatedContainer(
        margin: pagePadding,
        width: double.infinity,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: CupertinoSlidingSegmentedControl(
          children: {
            0: TabButton(selected: con.currentIndex == 0, text: "UpComming"),
            1: TabButton(selected: con.currentIndex == 1, text: "Completed"),
            2: TabButton(selected: con.currentIndex == 2, text: "Cancelled"),
          },
          thumbColor: primaryColor,
          backgroundColor: Colors.white,
          groupValue: con.currentIndex,
          onValueChanged: (value) {
            con.currentIndex = value ?? 0;
            onValueChanged.call();
          },
        ),
      );
    });
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final bool selected;
  const TabButton({required this.selected, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selected ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.w500,
                )),
      ),
    );
  }
}
