import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/data/search_box_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:get/get.dart';

class SearchDiscoverController extends GetxController {
  late RxInt expandedIndex;
  late RxList<SearchBoxDto> list;

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
    list = <SearchBoxDto>[].obs;
    list.addAll([
      SearchBoxDto(
        name: 'CLOTHING',
        image: ImageConstant.search1,
        color: 'A3A798',
        category: searchCategory,
      ),
      SearchBoxDto(
        name: 'ACCESSORIES',
        image: ImageConstant.search2,
        color: '898280',
      ),
      SearchBoxDto(
        name: 'SHOES',
        image: ImageConstant.search3,
        color: '44565C',
        category: searchCategory,
      ),
      SearchBoxDto(
        name: 'COLLECTION',
        image: ImageConstant.search4,
        color: 'B9AEB2',
      )
    ]);
    expandedIndex = RxInt(-1);
  }

  void toggleCard(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }

  void searchPage() {
    Get.toNamed(AppRoutes.search);
  }

  void onTapProduct(String name) {
    Get.toNamed(AppRoutes.productList, arguments: {'title': name});
  }
}
