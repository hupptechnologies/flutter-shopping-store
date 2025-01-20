import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/widgets/drawer/controller/filter_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchController extends GetxController {
  late List<String> recentSearch;
  late TextEditingController searchController;
  late FilterController filterController;

  final List<Map<String, dynamic>> categoryList = [
    {'id': 1, 'name': 'Jeans'},
    {'id': 2, 'name': 'Jakect'},
    {'id': 3, 'name': 'Bolero'},
    {'id': 4, 'name': 'Bodysuit'},
    {'id': 5, 'name': 'Men'},
  ];

  late RxList<dynamic> searchResult = [].obs;

  late List<Map<String, String>> popularProduct = [
    {
      "name": "Turtleneck Sweater",
      "price": "\$39.99",
      "image": ImageConstant.category1
    },
    {
      "name": "Long Sleeve Dress",
      "price": "\$45.00",
      "image": ImageConstant.category2
    },
    {"name": "Sportwear Set", "price": "", "image": ImageConstant.category3},
    {
      "name": "Elegant Dress",
      "price": "\$75.00",
      "image": ImageConstant.category4
    },
    {
      "name": "Turtleneck Sweater",
      "price": "\$39.99",
      "image": ImageConstant.category1
    },
    {
      "name": "Long Sleeve Dress",
      "price": "\$45.00",
      "image": ImageConstant.category2
    },
    {"name": "Sportwear Set", "price": "", "image": ImageConstant.category3},
    {
      "name": "Elegant Dress",
      "price": "\$75.00",
      "image": ImageConstant.category4
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    recentSearch = <String>["Sunglasses", "Sweater", "Hoodie", "Flutter"].obs;
    searchController = TextEditingController();
    filterController = Get.find<FilterController>();
  }

  void removeRecentSearch(int index) {
    recentSearch.removeAt(index);
  }

  void clearReactSearch() {
    recentSearch.clear();
  }

  void changeSearch(String? searchText) {
    if (searchText != null && searchText.isNotEmpty && searchText.length > 1) {
      searchResult.value = categoryList.where((el) {
        final name = el['name']?.toString().toLowerCase() ?? '';
        return name.contains(searchText);
      }).toList();
    } else {
      searchResult.value = [];
    }
  }

  void clearSearchField() {
    searchResult.value = [];
    searchController.clear();
  }

  void onSuggestionTap(SearchFieldListItem<Map<String, dynamic>> selected) {
    final int? id = selected.item!['id'];
    final String? title = selected.item!['name'];
    if (id != null) {
      clearSearchField();
      if (kDebugMode) {
        print(filterController.selectedColors);
      }
      Get.toNamed(AppRoutes.productList, arguments: {'id': id, 'title': title});
    }
  }
}
