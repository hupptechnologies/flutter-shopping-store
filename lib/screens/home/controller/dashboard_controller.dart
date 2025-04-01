import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/dto/dashboard_query_dto.dart';
import 'package:e_commerce/common/enum/product_type_enum.dart';
import 'package:e_commerce/dto/dashboard_dto.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final ProductService productService = ProductService();
  final DashboardQueryDto dashboardQuery = DashboardQueryDto();

  late RxInt categorySelectedIndex = 0.obs;
  late Rx<DashboardDto> dashboardData = DashboardDto(
    featuredProducts: [],
    recommendedProducts: [],
    topCollections: [],
  ).obs;
  
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

  @override
  void onInit() {
    super.onInit();
    dashboardQuery.setType(ProductTypeEnum.female);
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    final response = await productService.dashbaord(dashboardQuery);
    if (!response.error) {
      dashboardData.value = response.data!;
      print(dashboardData.value);
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
