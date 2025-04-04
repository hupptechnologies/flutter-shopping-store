import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardTopCollectionTextWithImage extends StatelessWidget {
  final double height;
  final EdgeInsetsGeometry textPadding;
  final String? title;
  final String subTitle;
  final double? subTitleFontSize;
  final Color? subTitleColor;
  final String? image;

  const DashboardTopCollectionTextWithImage({
    super.key,
    required this.height,
    required this.textPadding,
    this.title,
    required this.subTitle,
    this.subTitleFontSize,
    this.subTitleColor,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        margin: EdgeInsets.zero,
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: textPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.darkGray,
                        ),
                      ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: subTitleFontSize ?? 35,
                        fontWeight: FontWeight.w400,
                        color: subTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                  child: Image.network(
                    image!,
                    fit: BoxFit.cover,
                    height: height,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
