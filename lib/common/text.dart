import 'package:flutter/material.dart';

class PageHeading extends StatelessWidget {
  final String title;
  final Widget? traling;
  const PageHeading({super.key, required this.title, this.traling});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        traling ?? const SizedBox.shrink()
      ],
    );
  }
}
