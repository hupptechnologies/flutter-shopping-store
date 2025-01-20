import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  final String size;
  final bool isSelected;

  const SizeWidget({
    super.key,
    required this.size,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.darkGray : AppColors.lightGray,
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: isSelected
                ? Colors.white70
                : AppColors.darkGray.withOpacityValue(0.5),
          ),
        ),
      ),
    );
  }
}
