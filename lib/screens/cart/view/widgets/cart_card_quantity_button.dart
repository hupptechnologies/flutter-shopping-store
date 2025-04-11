import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CartCardQuantityButton extends StatelessWidget {
  final bool isIncrement;
  final int id;

  const CartCardQuantityButton({
    super.key,
    required this.isIncrement,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => incrementDecrementQuantity(product.id, isIncrement),
      child: Icon(
        isIncrement ? Icons.add : Icons.remove,
        size: 15,
        color: AppColors.dartGratWithOpaity5,
      ),
    );
  }
}
