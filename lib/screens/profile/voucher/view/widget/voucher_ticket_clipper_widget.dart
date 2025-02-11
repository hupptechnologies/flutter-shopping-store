import 'package:flutter/material.dart';

class LeftTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double cutoutRadius = 6.5;
    double centerY = size.height / 5;

    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(cutoutRadius, size.height);

    path.arcToPoint(
      Offset(0, size.height - cutoutRadius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );

    for (var i = 0; i < 4; i++) {
      double cutoutY = centerY * (1 + i);
      path.lineTo(0, cutoutY + cutoutRadius);
      path.arcToPoint(
        Offset(cutoutRadius, cutoutY),
        radius: Radius.circular(cutoutRadius),
        clockwise: false,
      );
      path.arcToPoint(
        Offset(0, cutoutY - cutoutRadius),
        radius: Radius.circular(cutoutRadius),
        clockwise: false,
      );
    }

    path.lineTo(0, cutoutRadius);
    path.arcToPoint(
      Offset(cutoutRadius, 0),
      radius: Radius.circular(cutoutRadius),
      clockwise: false,
    );

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
