import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:flutter/material.dart';

class PaymentsAddTitleWidget extends StatelessWidget {
  const PaymentsAddTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: MarginPadding.homeHorPadding,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Card Management',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            child: Row(
              children: [
                Text(
                  'Add new',
                  style: TextStyle(
                    color: AppColors.offRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.add_rounded,
                  color: AppColors.offRed,
                  size: 13,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
