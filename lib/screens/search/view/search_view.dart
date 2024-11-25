import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/screens/search/controller/search_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/drawer/view/filter_drawer_view.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:e_commerce/widgets/row_text_with_showall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class SearchView extends GetView<CustomSearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const FilterDrawerView(),
      endDrawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MarginPadding.homeHorPadding,
                  right: MarginPadding.homeHorPadding,
                  top: MarginPadding.homeTopPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BuildBackButton(backPage: CommonGetX.backPage),
                    buildSearchAndFilter(),
                    buildTextWithDeletedIcon(),
                    buildRecentSearchesList(),
                    const RowTextWithShowall(text: 'Popular this week'),
                  ],
                ),
              ),
              buildProdutList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchAndFilter() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(
                () => SearchField(
                  hint: 'Search',
                  controller: controller.searchController,
                  dynamicHeight: true,
                  searchInputDecoration: SearchInputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset(
                        ImageConstant.searchIcon,
                        color: AppColors.darkGray,
                        width: 40,
                        height: 20,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    filled: true,
                    fillColor: AppColors.lightGray.withOpacity(0.5),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  textAlign: TextAlign.start,
                  maxSuggestionBoxHeight: 300,
                  suggestionsDecoration: SuggestionDecoration(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onSearchTextChanged: (text) {
                    controller.changeSearch(text);
                    return null;
                  },
                  onSuggestionTap: controller.onSuggestionTap,
                  suggestions: controller.searchResult
                      .map((el) => SearchFieldListItem<Map<String, dynamic>>(
                          el['name'],
                          item: el))
                      .toList(),
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
                padding: const EdgeInsets.all(15),
                icon: SvgPicture.asset(
                  ImageConstant.filterIcon,
                  color: AppColors.darkGray,
                  height: 25,
                  width: 25,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildTextWithDeletedIcon() {
    return Obx(
      () => controller.recentSearch.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recent Searches',
                    style: TextStyle(
                      color: AppColors.darkGray.withOpacity(0.5),
                      fontSize: 15,
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.clearReactSearch(),
                    child: SvgPicture.asset(
                      ImageConstant.trashIcon,
                      color: AppColors.darkGray.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget buildRecentSearchesList() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          bottom: controller.recentSearch.isNotEmpty ? 10 : 0,
        ),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: controller.recentSearch.map((chip) {
            int index = controller.recentSearch.indexOf(chip);
            return Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: AppColors.lightGray.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    chip,
                    style: TextStyle(
                      color: AppColors.darkGray.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () => controller.removeRecentSearch(index),
                    icon: Icon(
                      Icons.close,
                      color: AppColors.darkGray.withOpacity(0.5),
                      size: 20,
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildProdutList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(controller.popularProduct.length, (index) {
          final item = controller.popularProduct[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? MarginPadding.homeHorPadding : 0,
              right: index == 4 ? MarginPadding.homeHorPadding : 16,
            ),
            child: ProductCard(
              name: item["name"]!,
              price: item["price"],
              image: item["image"],
              width: 200,
              height: 300,
            ),
          );
        }).toList(),
      ),
    );
  }
}
