import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailImageChangeCircle extends GetView<ProductDetailController> {
  const ProductDetailImageChangeCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final product = controller.productDto.value;
      final images = product?.images;

      if (images == null || images.isEmpty) {
        return const SizedBox.shrink();
      }

      return Positioned(
        bottom: controller.size.value,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            final isSelected = index == controller.currentImage.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () => controller.carouselController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
                child: Container(
                  padding:
                      isSelected ? const EdgeInsets.all(1) : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: AppColors.darkGray, width: 1)
                        : null,
                  ),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkGray,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
