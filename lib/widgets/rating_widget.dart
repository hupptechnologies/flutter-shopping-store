import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double value;
  final void Function(double)? onRatingChanged;
  final double size;
  final Color filledColor;

  const RatingWidget({
    super.key,
    required this.value,
    this.onRatingChanged,
    this.size = 16,
    this.filledColor = AppColors.lightGreen,
  });

  @override
  Widget build(BuildContext context) {
    if (onRatingChanged != null) {
      return RatingBar(
        isHalfAllowed: true,
        filledIcon: Icons.star_rate_rounded,
        emptyIcon: Icons.star_border_rounded,
        onRatingChanged: onRatingChanged,
        initialRating: value,
        halfFilledIcon: Icons.star_half_rounded,
        filledColor: filledColor,
        halfFilledColor: filledColor,
        size: size,
      );
    }

    return RatingBar.readOnly(
      isHalfAllowed: true,
      filledIcon: Icons.star_rate_rounded,
      emptyIcon: Icons.star_border_rounded,
      initialRating: value,
      halfFilledIcon: Icons.star_half_rounded,
      filledColor: filledColor,
      halfFilledColor: filledColor,
      size: size,
    );
  }
}
