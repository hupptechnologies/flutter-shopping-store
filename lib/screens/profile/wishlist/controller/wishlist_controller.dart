import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ProductService productService = ProductService();   
  late TabController tabController;

  late RxList<ProductDto> allItems = <ProductDto>[].obs;
  late RxList boardsList = [].obs;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      tabController.indexIsChanging
          ? null
          : tabController.index == 0
              ? fetchWishlistItems()
              : fetchWishlistBrands();
    });
    fetchWishlistItems();
    boardsList.value = DummyData.boardsList;
  }

  Future<void> fetchWishlistItems() async {
    final response = await productService.allFavorite();

    if (!response.error) {
      allItems.assignAll(response.data!);
    }
  }

  void fetchWishlistBrands() {
    print("Fetching Wishlist Brands...");
  }

  void toggleFavorite(int id) {
    final index = allItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (allItems[index].isFavorite) {
        allItems.removeAt(index);
      } else {
        allItems[index].isFavorite = true;
      }
      allItems.refresh();
    }
  }

  void onTapProduct(int id) {
    Get.toNamed(AppRoutes.productDetail, arguments: {'id': id});
  }
}
