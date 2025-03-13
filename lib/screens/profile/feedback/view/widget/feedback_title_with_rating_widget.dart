import 'package:e_commerce/screens/profile/feedback/controller/feedback_controller.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackTitleWithRatingWidget extends GetView<FeedbackController> {
  const FeedbackTitleWithRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'What is your opinion of GemStore?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => RatingWidget(
                  value: controller.rating.value,
                  size: 46,
                  filledColor: Colors.black,
                  onRatingChanged: controller.onRatingChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
