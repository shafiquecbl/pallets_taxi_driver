import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  final double padding;
  const MySeparator(
      {Key? key, this.height = 1, this.padding = 0, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashWidth = 10.0;
          final dashHeight = height;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Theme.of(context).disabledColor),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

// vertical separator
class VerticalSeparator extends StatelessWidget {
  final double padding;
  const VerticalSeparator(
      {Key? key, this.width = 1, this.padding = 0, this.color = Colors.black})
      : super(key: key);
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxHeight = constraints.constrainHeight();
          const dashHeight = 10.0;
          final dashWidth = width;
          final dashCount = (boxHeight / (2 * dashHeight)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white60),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
