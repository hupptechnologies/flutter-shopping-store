import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteWidget extends StatelessWidget {
  final bool isFavorite;
  final void Function()? onPressed;
  final bool isBoxShadow;

  const FavoriteWidget({
    super.key,
    required this.isFavorite,
    this.onPressed,
    this.isBoxShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            if (isBoxShadow)
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              )
          ],
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.zero,
        child: Icon(
          Icons.favorite,
          color: isFavorite ? AppColors.lightRed : AppColors.lightGray,
        ),
      ),
    );
  }
}
