import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  late Rx<RangeValues> rangeSlider = const RangeValues(0, 100).obs;
  late RxSet<int> selectedColors = <int>{}.obs;

  final List<String> colors = [
    'CE8722',
    'DC4447',
    '181E27',
    '44565C',
    'E4E4E4',
    '6D4F44',
    'DFA8A9',
  ];

  final List<Map<String, dynamic>> categoryList = [
    {'id': 1, 'name': 'Jeans'},
    {'id': 2, 'name': 'Jakect'},
    {'id': 3, 'name': 'Bolero'},
    {'id': 4, 'name': 'Bodysuit'},
    {'id': 5, 'name': 'Men'},
  ].obs;
  late RxList selectedCategories = [].obs;

  final List<Map<String, dynamic>> discountList = [
    {'id': 1, 'name': '50'},
    {'id': 2, 'name': '40'},
    {'id': 3, 'name': '30'},
    {'id': 4, 'name': '25'},
  ].obs;
  late RxInt selectedDiscount = 0.obs;

  late Rx<int> selectedRating = 0.obs;

  void changeRating(int index) {
    selectedRating.value = index;
  }

  void changeRangeSlider(RangeValues values) {
    rangeSlider.value = values;
  }

  void changeDiscount(bool isSelected, int id) {
    if (isSelected) {
      selectedDiscount.value = id;
    } else {
      selectedDiscount.value = 0;
    }
  }

  void toggleCategories(bool isSelected, int id) {
    if (isSelected) {
      selectedCategories.add(id);
    } else {
      selectedCategories.remove(id);
    }
  }

  void toggleColor(int index) {
    if (selectedColors.contains(index)) {
      selectedColors.remove(index);
    } else {
      selectedColors.add(index);
    }
  }

  void clearFilter() {
    rangeSlider.value = const RangeValues(0, 100);
    selectedColors.clear();
    selectedRating.value = 0;
    selectedCategories.clear();
    selectedDiscount.value = 0;
  }

  void saveFilter(BuildContext context) {
    Scaffold.of(context).closeEndDrawer();
  }
}
