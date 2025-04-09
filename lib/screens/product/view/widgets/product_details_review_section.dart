import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_progress_bar_rating.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_rating_out_of_rating.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_review_write_title.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_users_reviews.dart';
import 'package:e_commerce/widgets/accordion_text_icon.dart';
import 'package:flutter/material.dart';

class ProductDetailsReviewSection extends StatelessWidget {
  const ProductDetailsReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: AccordionTextIcon(
        title: 'Reviews',
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              ReviewSectionRatingOutOfRating(),
              ReviewSectionProgressBarRating(),
              ReviewSectionReviewWriteTitle(),
              ReviewSectionUsersReviews(),
            ],
          ),
        ),
      ),
    );
  }
}
