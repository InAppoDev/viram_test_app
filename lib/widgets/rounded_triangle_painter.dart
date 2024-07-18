import 'package:flutter/material.dart';

class RoundedTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFE84646)
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Define the size of the circle
    double circleRadius = 1; // Adjust this to change the size of the circle

    // Draw the circle at the top
    canvas.drawCircle(
        Offset(size.width / 2, circleRadius), circleRadius, paint);

    // Move to the start point (left bottom)
    path.moveTo(0, size.height);

    // Draw left inward curved line using a quadratic Bezier curve
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.6,
      size.width / 2 - circleRadius,
      circleRadius,
    );

    path.lineTo(size.width * 0.5 + circleRadius, circleRadius);

    // Draw right inward curved line using a quadratic Bezier curve
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.6,
      size.width,
      size.height,
    );

    // Draw bottom line
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
