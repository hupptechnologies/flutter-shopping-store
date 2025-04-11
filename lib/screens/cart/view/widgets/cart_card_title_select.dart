import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCardTitleSelect extends GetView<CartController> {
  final int id;
  final bool isSelected;
  final String productName;

  const CartCardTitleSelect({
    super.key,
    required this.id,
    required this.isSelected,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            productName,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => controller.toggleSelectingCart(id),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isSelected
                    ? AppColors.lightGreen
                    : AppColors.dartGratWithOpaity5,
              ),
              child: const Icon(Icons.check, size: 15, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
