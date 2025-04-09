import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:flutter/material.dart';

class ReviewSectionProgressBarRating extends StatelessWidget {
  const ReviewSectionProgressBarRating({super.key});

  @override
  Widget build(BuildContext context) {
    final ratings = [0, 3, 5, 12, 80];
    return ListView.builder(
        itemCount: ratings.length,
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final value = ratings[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  index.toString(),
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
                      value: (value / 100),
                      color: AppColors.lightGreen,
                      backgroundColor: AppColors.lightGray,
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  '${value.toString()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          );
        });
  }
}
