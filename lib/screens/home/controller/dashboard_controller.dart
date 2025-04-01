import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/dto/dashbaord_dto.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final ProductService productService = ProductService();
  final List<Map<String, String>> categorys = [
    {
      "image": ImageConstant.womenIcon,
      "label": "Women",
    },
    {
      "image": ImageConstant.menIcon,
      "label": "Man",
    },
    {
      "image": ImageConstant.accessoriesIcon,
      "label": "Accessories",
    },
    {
      "image": ImageConstant.beautyIcon,
      "label": "Beauty",
    }
  ];
  late RxInt categorySelectedIndex = 0.obs;
  late Rx<DashbaordDto> dashboardData = DashbaordDto(
    featuredProducts: [],
    recommendedProducts: [],
    topCollections: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    final response = await productService.dashbaord();
    if (!response.error) {
      dashboardData.value = response.data!;
    }
  }

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
