import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/data/search/search_box.dart';
import 'package:e_commerce/screens/home/controller/search_discover_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchDiscover extends GetView<SearchDiscoverController> {
  const SearchDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchBoxWithFilterBtn(),
          _buildCategoryCardList(),
        ],
      ),
    );
  }

  Widget _buildSearchBoxWithFilterBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.searchPage(),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.lightGray.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 15),
                    SvgPicture.asset(
                      ImageConstant.searchIcon,
                      color: AppColors.darkGray,
                      height: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Search',
                      style: TextStyle(color: AppColors.darkGray),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightGray.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(12),
              icon: SvgPicture.asset(
                ImageConstant.filterIcon,
                color: AppColors.darkGray,
              ),
              onPressed: controller.searchPage,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCardList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MarginPadding.homeHorPadding),
      child: Obx(
        () => Column(
          children: List.generate(controller.list.length, (index) {
            final item = controller.list[index];
            return _buildCategoryCard(
              text: item.name,
              color: AppColors.hexToColor(item.color),
              image: item.image,
              category: item.category,
              index: index,
            );
          }),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String text,
    required Color color,
    required String image,
    required List<SearchCategory>? category,
    required int index,
  }) {
    double height = 130;
    bool isExpanded = controller.expandedIndex.value == index;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controller.toggleCard(index),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: color,
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      text,
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
                              color.withOpacity(0.3),
                              Colors.white.withOpacity(0.2),
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
                              color.withOpacity(0.5),
                              Colors.white.withOpacity(0.25),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15),
                        ),
                        child: Image.asset(
                          image,
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
            child: isExpanded && category != null && category.isNotEmpty
                ? _buildCategoryList(category: category)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList({
    required List<SearchCategory> category,
    bool isSubCategory = false,
  }) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.all(isSubCategory ? 0 : 10),
      child: Column(
        children: List.generate(category.length, (index) {
          final item = category[index];
          final hasSubCategory = item.subCategory?.isNotEmpty ?? false;
          return Column(
            children: [
              Row(
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
                      item.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${item.item} Items',
                        style: TextStyle(
                          color: AppColors.darkGray.withOpacity(0.6),
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
              if (hasSubCategory) ...[
                const Divider(thickness: 1.0, color: AppColors.lightGray),
                _buildCategoryList(
                    category: item.subCategory!, isSubCategory: true),
              ],
              if (category.last != item)
                const Divider(thickness: 1.0, color: AppColors.lightGray),
            ],
          );
        }),
      ),
    );
  }
}
