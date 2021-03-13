import 'package:flutter/material.dart';

class AuthPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    var paint = Paint();
    var path3 = Path();
    path3.moveTo(width, 0);
    path3.lineTo(width, height * 0.4);
    path3.quadraticBezierTo(width * 0.4, height * 0.5, width * 0.3, 0);
    path3.close();
    paint.color = Color(0xFF20B0FF);
    canvas.drawPath(path3, paint);
    var path2 = Path();
    path2.lineTo(width, 0);
    path2.lineTo(width, height * 0.20);
    path2.cubicTo(width * 0.95, height * 0.25, width * 0.8, height * 0.3,
        width * 0.65, height * 0.28);
    path2.cubicTo(
        width * 0.3, height * 0.25, width * 0.4, height * 0.5, 0, height * 0.4);
    path2.close();
    paint.color = Color(0xFF4C4C4C);
    canvas.drawPath(path2, paint);

    var path = Path();
    path.lineTo(width * 0.60, 0);
    path.cubicTo(width * 0.6, height * 0.05, width * 0.5, height * 0.1,
        width * 0.3, height * 0.1);
    path.cubicTo(width * 0.1, height * 0.10, width * 0.15, height * 0.17, 0,
        height * 0.2);
    path.close();
    paint.color = Color(0xFFEC8E72);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
