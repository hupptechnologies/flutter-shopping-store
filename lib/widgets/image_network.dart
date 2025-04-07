import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String url;
  final BoxFit? fit;
  final double? width;

  const ImageNetwork({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      width: width,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.lightGray,
          child: const Center(
            child: Icon(
              Icons.image,
              color: AppColors.darkGray,
            ),
          ),
        );
      },
    );
  }
}
