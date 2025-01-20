import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/rating/controller/rating_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RatingView extends GetView<RatingController> {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbarTitle(
        title: 'Rate Product',
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginPadding.homeHorPadding,
            vertical: MarginPadding.homeTopPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildReviewBox(),
                Obx(() => _buildRating(controller.rating.value)),
                const SizedBox(height: 8),
                _buildReviewDescriptionBox(),
                const SizedBox(height: 8),
                _buildImagesPicker(),
                const SizedBox(height: 20),
                ButtonWidget(
                  title: 'Submit Review',
                  isDisable: false,
                  verticalPadding: 12,
                  onPressed: controller.submitReview,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildGetImage() {
    return controller.selectedImages.map((el) {
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
    }).toList();
  }

  Widget _buildImagesPicker() {
    return Obx(
      () => Wrap(
        spacing: 5,
        runSpacing: 12,
        children: [
          ..._buildGetImage(),
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
    );
  }

  Widget _buildReviewDescriptionBox() {
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
        controller: controller.textController,
        maxLines: 5,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: const InputDecoration(
          hintText: 'Would you like to write anything about this product?',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
        scrollPhysics: const BouncingScrollPhysics(),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildRating(double value) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingWidget(
            value: value,
            size: 55,
            onRatingChanged: controller.onChangeRating,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewBox() {
    return _buildContainer(
      padding: 20,
      color: AppColors.darkGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(ImageConstant.giftIcon),
          const Text(
            'Submit your review to get 5 points',
            style: TextStyle(color: Colors.white),
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildContainer({
    required double padding,
    required Color color,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(padding),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: child,
    );
  }
}
