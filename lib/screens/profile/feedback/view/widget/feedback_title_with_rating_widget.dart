import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class FeedbackTitleWithRatingWidget extends StatelessWidget {
  const FeedbackTitleWithRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'What is your opinion of GemStore?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingWidget(
                value: 4,
                size: 46,
                filledColor: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
