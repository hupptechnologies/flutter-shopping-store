import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class ReviewSectionRatingOutOfRating extends StatelessWidget {
  const ReviewSectionRatingOutOfRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const Text(
                '4.9',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
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
          children: [
            const RatingWidget(
              value: 5,
              size: 25,
            ),
            const SizedBox(height: 5),
            Text(
              '83 ratings',
              style: TextStyle(
                color: AppColors.darkGray.withOpacityValue(0.5),
              ),
            )
          ],
        )
      ],
    );
  }
}