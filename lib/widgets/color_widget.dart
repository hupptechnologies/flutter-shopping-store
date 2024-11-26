import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  final String color;
  final bool isSelected;

  const ColorWidget({
    super.key,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isSelected ? const EdgeInsets.all(1.5) : EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.black, width: 1.5) : null,
      ),
      child: Container(
        width: 22,
        height: 22,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.hexToColor(color),
        ),
      ),
    );
  }
}
