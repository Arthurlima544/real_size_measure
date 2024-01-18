import 'package:flutter/material.dart';

class LineBetweenPoints extends StatelessWidget {
  final Offset startPoint;
  final Offset endPoint;

  const LineBetweenPoints({
    super.key,
    required this.startPoint,
    required this.endPoint,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: LinePainter(startPoint, endPoint),
    );
  }
}

class LinePainter extends CustomPainter {
  final Offset startPoint;
  final Offset endPoint;

  LinePainter(this.startPoint, this.endPoint);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
