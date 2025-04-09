import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

class ProductDetailAddToCartButton extends GetView<ProductDetailController> {
  const ProductDetailAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDisabled = controller.selectedColor.value == null ||
          controller.selectedSize.value == null;
      return GestureDetector(
        onTap: isDisabled ? null : controller.onTapAddToCart,
        child: Container(
          decoration: BoxDecoration(
            color: isDisabled
                ? AppColors.lightGray.withOpacityValue(0.9)
                : AppColors.darkGray,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageConstant.shoppingIcon,
                  color: isDisabled ? Colors.grey : null,
                ),
                const SizedBox(width: 10),
                Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: isDisabled ? Colors.grey : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
