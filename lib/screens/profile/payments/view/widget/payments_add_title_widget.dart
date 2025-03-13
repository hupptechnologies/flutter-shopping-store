import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/payments/controller/payments_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsAddTitleWidget extends GetView<PaymentsController> {
  const PaymentsAddTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: MarginPadding.homeHorPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Card Management',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: controller.gotoCard,
            child: const Row(
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
