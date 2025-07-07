import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final Color color;
  final double height;
  final double dashWidth;
  final double dashSpacing;

  const DottedDivider({
    super.key,
    this.color = Colors.grey,
    this.height = 1,
    this.dashWidth = 4,
    this.dashSpacing = 3,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: CustomPaint(
        painter: _DottedLinePainter(
          color: color,
          dashWidth: dashWidth,
          dashSpacing: dashSpacing,
        ),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpacing;

  _DottedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
