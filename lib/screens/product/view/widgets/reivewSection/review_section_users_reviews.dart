import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/review_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ReviewSectionUsersReviews extends GetView<ProductDetailController> {
  const ReviewSectionUsersReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final reviews = controller.productDto.value?.reviews;

      if (reviews == null || reviews.isEmpty) {
        return const SizedBox.shrink();
      }

      return ListView.builder(
        itemCount: controller.productDto.value!.reviews!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final review = controller.productDto.value!.reviews![index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ReviewCardWidget(
              image: ImageConstant.category1,
              name: review.user?.fullName ?? '',
              rating: review.rating,
              ago: review.ago ?? '',
              message: review.comment ?? '',
            ),
          );
        },
      );
    });
  }
}
