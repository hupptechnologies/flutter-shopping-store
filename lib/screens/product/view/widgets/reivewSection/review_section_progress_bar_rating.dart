import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ReviewSectionProgressBarRating extends GetView<ProductDetailController> {
  const ReviewSectionProgressBarRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ratingPercentage = controller.productDto.value?.ratingPercentage;

      if (ratingPercentage == null) {
        return const SizedBox.shrink();
      }

      final ratingPercentageList = ratingPercentage.entries.toList();

      return ListView.builder(
          itemCount: ratingPercentageList.length,
          reverse: true,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = ratingPercentageList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.key,
                    style: TextStyle(
                      color: AppColors.darkGray.withOpacityValue(0.5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.lightGreen,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: (item.value / 100),
                        color: AppColors.lightGreen,
                        backgroundColor: AppColors.lightGray,
                        minHeight: 6,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 55,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${item.value.round()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
    });
  }
}
