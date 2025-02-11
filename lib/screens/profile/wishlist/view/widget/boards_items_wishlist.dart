import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardsItemsWishlist extends StatelessWidget {
  final String title;
  final int conunt;
  final String firstImage;
  final String secoundImage;
  final List<List<String>> thirdImages;

  const BoardsItemsWishlist({
    super.key,
    required this.title,
    required this.conunt,
    required this.firstImage,
    required this.secoundImage,
    required this.thirdImages,
  });

  @override
  Widget build(BuildContext context) {
    const double spacing = 3;

    final List<List<int>> flexValues = [
      [9, 7],
      [7, 9]
    ];

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 148,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Row(
              spacing: spacing,
              children: [
                Expanded(
                  child: Image.asset(
                    firstImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    secoundImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Row(
                    spacing: spacing,
                    children: List.generate(
                      flexValues.length,
                      (rowIndex) {
                        return Expanded(
                          child: Column(
                            spacing: spacing,
                            children: List.generate(flexValues[rowIndex].length,
                                (index) {
                              return Expanded(
                                flex: flexValues[rowIndex][index],
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.asset(
                                    thirdImages[rowIndex][index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SvgPicture.asset(ImageConstant.rightArrowIcon)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '${conunt.toString()} Items',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.dartGratWithOpaity5,
            ),
          ),
        ),
        const Divider(color: AppColors.lightGray)
      ],
    );
  }
}
