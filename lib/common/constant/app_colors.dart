import 'dart:ui';

abstract class AppColors {
  static const Color lightGray = Color(0xFFE7E8E9);
  static const Color darkGray = Color(0xFF464447);
  static const Color offRed = Color.fromARGB(255, 186, 49, 49);
  static const Color successMsgBG = Color.fromARGB(227, 68, 165, 3);

  static Color hexToColor(String hexCode) {
    if (hexCode.length == 6) {
      hexCode = 'FF$hexCode';
    }
    return Color(int.parse('0x$hexCode'));
  }
}
