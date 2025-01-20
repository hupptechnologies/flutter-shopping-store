import 'dart:ui';

extension ColorOpacity on Color {
  Color withOpacityValue (double value) {
    return withAlpha((value * 255).toInt());
  }
}