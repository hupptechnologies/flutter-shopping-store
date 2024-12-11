import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final String title;
  final bool isDisable;
  final bool isBorder;
  final double verticalPadding;

  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.title,
    required this.isDisable,
    this.isBorder = false,
    this.verticalPadding = 15,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisable ? null : () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
          backgroundColor: isBorder ? Colors.white : AppColors.darkGray,
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          splashFactory: NoSplash.splashFactory,
          side: isBorder
              ? BorderSide(color: AppColors.dartGratWithOpaity5, width: 1)
              : BorderSide.none,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: (isDisable || isBorder)
                ? AppColors.dartGratWithOpaity5
                : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
