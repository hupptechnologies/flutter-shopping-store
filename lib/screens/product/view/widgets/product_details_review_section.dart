import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_progress_bar_rating.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_rating_out_of_rating.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_review_write_title.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_users_reviews.dart';
import 'package:e_commerce/widgets/accordion_text_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductDetailsReviewSection extends GetView<ProductDetailController> {
  const ProductDetailsReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AccordionTextIcon(
        title: 'Reviews',
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              const ReviewSectionRatingOutOfRating(),
              const ReviewSectionProgressBarRating(),
              const ReviewSectionReviewWriteTitle(),
              Obx(() {
                final reviews = controller.productDto.value?.reviews ?? [];
                return ReviewSectionUsersReviews(reviews: reviews);
              }),
              Obx(() {
                final totalReviews = controller.productDto.value?.totalRating;
                final reviews = controller.productDto.value?.reviews?.length;

                if (reviews == null ||
                    totalReviews == null ||
                    reviews == 0 ||
                    totalReviews == 0 ||
                    reviews > totalReviews) {
                  return const SizedBox.shrink();
                }

                return GestureDetector(
                  onTap: controller.onReviewList,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Show more',
                      style: TextStyle(
                        color: AppColors.dartGratWithOpaity5,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
