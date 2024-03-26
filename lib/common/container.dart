import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  final String text;
  final void Function()? onTab;
  const SearchContainer({super.key, required this.text, this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: kTextTabBarHeight,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            width: 10,
          ),
          const Expanded(
              flex: 1,
              child: Icon(
                Iconsax.search_normal,
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(flex: 9, child: Text(text)),
        ]),
      ),
    );
  }
}

class DottedVerticalLine extends StatelessWidget {
  final double height;
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedVerticalLine({
    this.height = 100,
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.gap = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: strokeWidth,
      child: CustomPaint(
        painter: _DottedLinePainter(
          color: color,
          strokeWidth: strokeWidth,
          gap: gap,
        ),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  _DottedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startY = 0;

    while (startY < size.height) {
      final Offset start = Offset(size.width / 2, startY);
      final Offset end = Offset(size.width / 2, startY + gap);
      canvas.drawLine(start, end, paint);
      startY += 2 * gap;
    }
  }

  @override
  bool shouldRepaint(_DottedLinePainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        gap != oldDelegate.gap;
  }
}
