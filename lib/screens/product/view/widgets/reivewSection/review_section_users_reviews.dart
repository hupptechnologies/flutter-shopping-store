import 'package:e_commerce/dto/review_dto.dart';
import 'package:e_commerce/widgets/review_card_widget.dart';
import 'package:flutter/material.dart';

class ReviewSectionUsersReviews extends StatelessWidget {
  final List<ReviewDto> reviews;

  const ReviewSectionUsersReviews({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const SizedBox.shrink();
    }
    return ListView.builder(
      itemCount: reviews.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ReviewCardWidget(
            image: review.user?.image,
            name: review.user?.fullName ?? '',
            rating: review.rating,
            ago: review.ago ?? '',
            message: review.comment ?? '',
          ),
        );
      },
    );
  }
}
