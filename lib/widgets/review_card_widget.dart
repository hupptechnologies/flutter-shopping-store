import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class ReviewCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final String? rating;
  final String? ago;
  final String message;

  const ReviewCardWidget({
    super.key,
    required this.image,
    required this.name,
    this.rating,
    this.ago,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 25,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    RatingWidget(
                      value: rating != null ? double.parse(rating!) : 0.0,
                      size: 18,
                    )
                  ],
                )
              ],
            ),
            Text(
              ago ?? '',
              style: TextStyle(color: AppColors.dartGratWithOpaity5),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(message),
      ],
    );
  }
}
