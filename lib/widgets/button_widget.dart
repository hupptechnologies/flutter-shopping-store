import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final String title;
  final bool isDisable;

  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.title,
    required this.isDisable,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isDisable ? null : () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGray,
          padding: const EdgeInsets.symmetric(vertical: 15),
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isDisable ? AppColors.dartGratWithOpaity5 : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
