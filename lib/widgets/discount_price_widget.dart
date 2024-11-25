import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class DiscountPriceWidget extends StatelessWidget {
  final double discountPrice;
  final double price;

  const DiscountPriceWidget({
    super.key,
    required this.discountPrice,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$ $discountPrice',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '\$ $price',
          style: TextStyle(
              color: AppColors.darkGray.withOpacity(0.5),
              decoration: TextDecoration.lineThrough,
              decorationThickness: 1,
              decorationColor: AppColors.darkGray.withOpacity(0.5)),
        ),
      ],
    );
  }
}
