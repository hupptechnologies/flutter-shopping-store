import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CartCardQuantityButton extends GetView<CartController> {
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
      onTap: () => controller.updateQuantity(id, isIncrement),
      child: Icon(
        isIncrement ? Icons.add : Icons.remove,
        size: 15,
        color: AppColors.dartGratWithOpaity5,
      ),
    );
  }
}
