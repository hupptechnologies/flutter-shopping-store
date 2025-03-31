import 'package:e_commerce/common/dto/meta.dart';
import 'package:e_commerce/common/dto/product_query_dto.dart';
import 'package:e_commerce/dto/product.dart';
import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/extension/string_extensions.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  final ProductService productService = ProductService();
  final ProductQueryDto queryDto = ProductQueryDto();
  final RxList<ProductDto> products= <ProductDto>[].obs;

  late RxList<Product> productList = <Product>[].obs;
  late Meta meta;
  // late RxList<CategoryDto> list = RxList();
  late RxString title = ''.obs;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;
    title.value = arguments['title'].toString().toFirstLatterUppercase();
    final categoryId = arguments['categoryId'];
    if (categoryId != null) {
      queryDto.setCategoryId(categoryId);
      fetchProductList();
    }
  }

  void toggleFavorite(int id) {
    final index = productList.indexWhere((item) => item.id == id);
    if (index != -1) {
      final bool isFavorite = !productList[index].isFavorite;
      productList[index].isFavorite = isFavorite;
      productList.refresh();
    }
  }

  void onTapProduct(int id) {
    if (kDebugMode) {
      print('onTapProduct   $id');
    }
    Get.toNamed(AppRoutes.productDetail, arguments: {'id': id});
  }

  Future<void> fetchProductList() async {
    if (queryDto.categoryId == null) {
      return;
    }
    final response = await productService.list(queryDto);
    if (!response.error) {
      products.assignAll(response.data!.items);
      meta = response.data!.meta;
      return;
    }
  }
}
