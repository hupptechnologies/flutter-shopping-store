import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewSectionReviewWriteTitle extends GetView<ProductDetailController> {
  const ReviewSectionReviewWriteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Text(
            '${controller.productDto.value?.totalRating ?? 0} Reviews',
            style: TextStyle(
              color: AppColors.dartGratWithOpaity5,
            ),
          ),),
          Row(
            children: [
              Text(
                'WRITE A REVIEW',
                style: TextStyle(
                  color: AppColors.dartGratWithOpaity5,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.mode_edit_rounded,
                color: AppColors.dartGratWithOpaity5,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
