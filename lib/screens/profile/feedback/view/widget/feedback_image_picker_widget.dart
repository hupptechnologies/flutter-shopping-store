import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/profile/feedback/controller/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FeedbackImagePickerWidget extends GetView<FeedbackController> {
  const FeedbackImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Obx(
        () => Wrap(
          spacing: 5,
          runSpacing: 12,
          children: [
            ...controller.selectedImages.map((el) {
              return Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 2,
                    color: AppColors.lightGray,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: FileImage(el),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => controller.removeImage(el),
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacityValue(0.7),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            GestureDetector(
              onTap: controller.pickImages,
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 2,
                    color: AppColors.lightGray,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: SvgPicture.asset(
                  ImageConstant.cameraIcon,
                  fit: BoxFit.cover,
                  color: AppColors.dartGratWithOpaity5.withOpacityValue(0.2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
