import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  late RxInt categorySelectedIndex = 0.obs;

  void changeCategorySeletedIndex(int index) {
    categorySelectedIndex.value = index;
  }

  late List<Map<String, String>> items = [
    {
      "category": "Turtleneck Sweater",
      "price": "\$39.99",
      "image": ImageConstant.category1
    },
    {
      "category": "Long Sleeve Dress",
      "price": "\$45.00",
      "image": ImageConstant.category2
    },
    {
      "category": "Sportwear Set",
      "price": "",
      "image": ImageConstant.category3
    },
    {
      "category": "Elegant Dress",
      "price": "\$75.00",
      "image": ImageConstant.category4
    },
    {
      "category": "Turtleneck Sweater",
      "price": "\$39.99",
      "image": ImageConstant.category1
    },
    {
      "category": "Long Sleeve Dress",
      "price": "\$45.00",
      "image": ImageConstant.category2
    },
    {
      "category": "Sportwear Set",
      "price": "",
      "image": ImageConstant.category3
    },
    {
      "category": "Elegant Dress",
      "price": "\$75.00",
      "image": ImageConstant.category4
    },
  ].obs;
}
