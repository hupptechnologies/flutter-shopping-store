import 'package:e_commerce/common/dto/category_query_dto.dart';
import 'package:e_commerce/common/dto/meta.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/category_dto.dart';
import 'package:e_commerce/dto/search_box_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/category_service.dart';
import 'package:get/get.dart';

class SearchDiscoverController extends GetxController {
  final CategoryService categoryService = CategoryService();
  final CategoryQueryDto queryDto = CategoryQueryDto(depth: 2, isProductCount: true);

  late Meta meta;
  late RxList<CategoryDto> categoryList = RxList();
  late RxInt expandedCategory;

  final List<SearchCategory> searchCategory = [
    SearchCategory(name: 'Jacket', item: 180),
    SearchCategory(name: 'Skirts', item: 40),
    SearchCategory(
      name: 'Dresses',
      item: 36,
      subCategory: [
        SearchCategory(name: 'Jeans', item: 15),
        SearchCategory(name: 'Sweaters', item: 40)
      ],
    ),
    SearchCategory(name: 'T-Shirts', item: 23),
  ];

  @override
  void onInit() {
    super.onInit();
    getCategories();
    expandedCategory = RxInt(-1);
  }

  Future<void> getCategories() async {
    final response = await categoryService.list(queryDto);
    if (!response.error) {
      categoryList.assignAll(response.data!.items);
      meta = response.data!.meta;
      return;
    }
    CommonSnackbar.error(response.message);
  } 

  void toggleCategory(int id) {
    if (expandedCategory.value == id) {
      expandedCategory.value = -1;
      return;
    }
    expandedCategory.value = id;
  }

  void searchPage() {
    Get.toNamed(AppRoutes.search);
  }

  void onTapProduct(int id, String name) {
    Get.toNamed(AppRoutes.productList, arguments: {'categoryId': id, 'title': name});
  }
}
