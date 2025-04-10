import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ReviewSectionRatingOutOfRating extends GetView<ProductDetailController> {
  const ReviewSectionRatingOutOfRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Obx(
                () => Text(
                  controller.productDto.value?.averageRating?.toString() ?? '',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'OUT OF 5',
                style: TextStyle(
                  color: AppColors.darkGray.withOpacityValue(0.5),
                ),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 5,
          children: [
            Obx(() {
              final value = controller.productDto.value?.averageRating ?? 0;
              return RatingWidget(
                value: value,
                size: 25,
              );
            }),
            Obx(
              () => Text(
                '${controller.productDto.value?.totalRating?.toString() ?? '0'} ratings',
                style: TextStyle(
                  color: AppColors.darkGray.withOpacityValue(0.5),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
