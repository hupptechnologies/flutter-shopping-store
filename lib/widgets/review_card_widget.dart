import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class ReviewCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final double reting;
  final String time;
  final String message;

  const ReviewCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.reting,
    required this.time,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
                    const RatingWidget(
                      value: 5,
                      size: 18,
                    )
                  ],
                )
              ],
            ),
            Text(
              time,
              style: TextStyle(color: AppColors.dartGratWithOpaity5),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          'I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!',
        )
      ],
    );
  }
}
