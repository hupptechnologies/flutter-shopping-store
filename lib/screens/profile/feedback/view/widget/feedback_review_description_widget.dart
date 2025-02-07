import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/screens/profile/feedback/controller/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackReviewDescriptionWidget extends GetView<FeedbackController> {
  const FeedbackReviewDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.dartGratWithOpaity5,
            blurRadius: 0.5,
            spreadRadius: 0.2,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller.descriptionController,
        maxLines: 5,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: const InputDecoration(
          hintText: 'Would you like to write anything about this product?',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
        scrollPhysics: const BouncingScrollPhysics(),
        textAlign: TextAlign.start,
      ),
    );
  }
}
