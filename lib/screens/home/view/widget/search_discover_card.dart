import 'package:e_commerce/dto/category_dto.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/home/controller/search_discover_controller.dart';
import 'package:e_commerce/screens/home/view/widget/search_discover_sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDiscoverCard extends GetView<SearchDiscoverController> {
  final CategoryDto category;
  const SearchDiscoverCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    double height = 130;
    Color color = category.getColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(children: [
        GestureDetector(
          onTap: () => controller.toggleCategory(category.id!),
          child: Card(
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: color,
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    category.name!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: height,
                      height: height,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            color.withOpacityValue(0.3),
                            Colors.white.withOpacityValue(0.2),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: height - 35,
                      height: height - 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            color.withOpacityValue(0.5),
                            Colors.white.withOpacityValue(0.25),
                          ],
                        ),
                      ),
                    ),
                    if (category.getImages != null)
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15),
                        ),
                        child: Image.network(
                          category.getImages!,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Obx(
            () => controller.expandedCategory.value == category.id &&
                    category.children != null &&
                    category.children!.isNotEmpty
                ? SearchDiscoverSubCategory(categories: category.children!)
                : const SizedBox.shrink(),
          ),
        ),
      ]),
    );
  }
}
