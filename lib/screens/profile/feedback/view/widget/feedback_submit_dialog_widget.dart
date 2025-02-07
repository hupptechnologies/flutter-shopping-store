import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackSubmitDialogWidget extends StatelessWidget {
  const FeedbackSubmitDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 81;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: height,
                  height: height,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGreen.withOpacityValue(0.26),
                  ),
                ),
                Container(
                  width: height - 27,
                  height: height - 27,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGreen,
                  ),
                  child: const Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Thank you for your feedback!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "We appreciated your feedback. \nWe’ll use your feedback to improve your experience.",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: ButtonWidget(
                title: 'Done',
                isDisable: false,
                verticalPadding: 5,
                onPressed: () {
                  Get.back();
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
