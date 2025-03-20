import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/home/controller/search_discover_controller.dart';
import 'package:e_commerce/screens/home/view/widget/search_discover_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchDiscover extends GetView<SearchDiscoverController> {
  const SearchDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.getCategories,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBoxWithFilterBtn(),
            _buildCategoryCardList(),
          ],
        ),
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
                  color: AppColors.lightGray.withOpacityValue(0.5),
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
              color: AppColors.lightGray.withOpacityValue(0.5),
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
          children: List.generate(controller.categoryList.length, (index) {
            return SearchDiscoverCard(category: controller.categoryList[index]);
          }),
        ),
      ),
    );
  }
}
