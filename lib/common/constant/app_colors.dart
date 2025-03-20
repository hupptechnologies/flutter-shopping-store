import 'package:flutter/material.dart';

import 'package:e_commerce/extension/color_extensions.dart';

abstract class AppColors {
  static const Color lightGray = Color(0xFFE7E8E9);
  static const Color darkGray = Color(0xFF464447);
  static Color dartGratWithOpaity5 = AppColors.darkGray.withOpacityValue(0.5);
  static const Color offRed = Color.fromARGB(255, 186, 49, 49);
  static const Color lightRed = Color(0xFFFF6E6E);
  static const Color successMsgBG = Color.fromARGB(227, 68, 165, 3);
  static const Color lightGreen = Color(0xFF508A7B);
  static const Color orangeAccent = Colors.orangeAccent;
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static Color hexToColor(String? hex) {
    if (hex == null) {
      return Colors.transparent;
    }
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    return Color(int.parse("0x$hex"));
  }
}
