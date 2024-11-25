import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    this.price,
    this.image,
    this.width = 120,
    this.height = 180,
  });

  final String? image;
  final String name;
  final String? price;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: height,
                width: width,
                color: AppColors.lightGray,
                child: image != null && image!.isNotEmpty
                    ? Image.asset(
                        image!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            defaultImage(),
                      )
                    : defaultImage(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          if (price != null)
            Text(
              price!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Widget defaultImage() {
    return Container(
      color: AppColors.lightGray,
      child: const Center(
        child: Icon(
          Icons.image,
          color: AppColors.darkGray,
        ),
      ),
    );
  }
}
