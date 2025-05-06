import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double value;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;

  CustomCircularProgressIndicator({
    required this.value,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(120, 110), // Size of the circular indicator
      painter: _CustomProgressPainter(
        value: value,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        valueColor: valueColor,
      ),
    );
  }
}

class _CustomProgressPainter extends CustomPainter {
  final double value;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;

  _CustomProgressPainter({
    required this.value,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the progress arc (this will be drawn first, so it will be at the bottom)
    final Paint progressPaint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Calculate the sweep angle for the progress arc
    final double sweepAngle = 2 * 3.14159265359 * value;

    // Create a Rect for the arc and adjust it
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2 - strokeWidth / 2,
    );

    progressPaint.strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -3.14159265359 / 2,
      sweepAngle,
      false,
      progressPaint,
    );


    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw the background circle (full circle)
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 - strokeWidth / 2,
      backgroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
