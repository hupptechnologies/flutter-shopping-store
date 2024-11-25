import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class BuildRangeSlider extends StatelessWidget {
  final RangeValues values;
  final Function(RangeValues)? onChanged;
  final double min;
  final double max;

  const BuildRangeSlider({
    super.key,
    required this.values,
    this.onChanged,
    this.min = 0,
    this.max = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RangeSlider(
          values: values,
          min: 0,
          max: 100,
          labels: RangeLabels(
            '\$${values.start.round()}',
            '\$${values.end.round()}',
          ),
          onChanged: onChanged,
          activeColor: Colors.black,
          inactiveColor: AppColors.lightGray,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${values.start.round()}'),
            Text('\$${values.end.round()}'),
          ],
        ),
      ],
    );
  }
}
