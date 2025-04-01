import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:flutter/material.dart';

class NetworkOrAssetImage extends StatelessWidget {
  final String? imageUrl;
  final String placeholderAsset;
  final BoxFit fit;

  const NetworkOrAssetImage({
    super.key,
    required this.imageUrl,
    this.placeholderAsset = ImageConstant.empty,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.isNotEmpty
        ? Image.network(
            imageUrl!,
            fit: fit,
          )
        : Container(
            color: AppColors.lightGray,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Image.asset(
              placeholderAsset,
              fit: fit,
            ),
          );
  }
}
