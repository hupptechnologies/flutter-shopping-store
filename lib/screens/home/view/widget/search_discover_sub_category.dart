import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/dto/category_dto.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/home/controller/search_discover_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDiscoverSubCategory extends GetView<SearchDiscoverController> {
  final List<CategoryDto> categories;
  final bool isSubCategory;

  const SearchDiscoverSubCategory({
    super.key,
    required this.categories,
    this.isSubCategory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.all(isSubCategory ? 0 : 10),
      child: Column(
        children: List.generate(categories.length, (index) {
          final item = categories[index];
          final hasSubCategory = item.children?.isNotEmpty ?? false;
          return Column(
            children: [
              GestureDetector(
                onTap: () => controller.onTapProduct(item.name!),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text on the left side
                    Padding(
                      padding: EdgeInsets.only(
                        left: isSubCategory ? 25 : 16.0,
                        right: 16.0,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        item.name!,
                        style: const TextStyle(
                          fontSize: 16.0,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${item.productCount!} Items',
                          style: TextStyle(
                            color: AppColors.darkGray.withOpacityValue(0.6),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkGray,
                          size: 15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if (hasSubCategory) ...[
                const Divider(thickness: 1.0, color: AppColors.lightGray),
                SearchDiscoverSubCategory(
                    categories: item.children!, isSubCategory: true),
              ],
              if (categories.last != item)
                const Divider(thickness: 1.0, color: AppColors.lightGray),
            ],
          );
        }),
      ),
    );
  }
}
