import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double dotWidth;
  final double dotHeight;
  final double spacing;
  final Color color;
  final Axis axis;

  const DottedLine({
    super.key,
    this.dotWidth = 4.0,
    this.dotHeight = 1.5,
    this.spacing = 8.0,
    this.color = Colors.black,
    this.axis = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: axis == Axis.horizontal
          ? Size(double.infinity, dotHeight)
          : Size(dotWidth, double.infinity),
      painter: DottedLinePainter(
        dotWidth: dotWidth,
        dotHeight: dotHeight,
        spacing: spacing,
        color: color,
        axis: axis,
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final double dotWidth;
  final double dotHeight;
  final double spacing;
  final Color color;
  final Axis axis;

  DottedLinePainter({
    required this.dotWidth,
    required this.dotHeight,
    required this.spacing,
    required this.color,
    required this.axis,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double maxExtent = axis == Axis.horizontal ? size.width : size.height;
    double position = 0;

    while (position < maxExtent) {
      final rect = axis == Axis.horizontal
          ? Rect.fromLTWH(position, (size.height - dotHeight) / 2, dotWidth, dotHeight)
          : Rect.fromLTWH((size.width - dotWidth) / 2, position, dotWidth, dotHeight);

      canvas.drawRect(rect, paint);
      position += dotWidth + spacing;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) {
    return oldDelegate.dotWidth != dotWidth ||
        oldDelegate.dotHeight != dotHeight ||
        oldDelegate.spacing != spacing ||
        oldDelegate.color != color ||
        oldDelegate.axis != axis;
  }
}
