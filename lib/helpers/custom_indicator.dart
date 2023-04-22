import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math' as math;

class CustomTriangleIndicator extends TriangleIndicator {
  final double height;
  final double width;
  final bool notRotate;

  const CustomTriangleIndicator(
      {super.key, required this.height, required this.width,required this.notRotate});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: notRotate
          ? Transform.rotate(
              angle: 180 * (math.pi / 180),
              child: Container(
                width: width,
                height: height,
                child: CustomPaint(
                  painter: _TrianglePainter(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Container(
              width: width,
              height: height,
              child: CustomPaint(
                painter: _TrianglePainter(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
