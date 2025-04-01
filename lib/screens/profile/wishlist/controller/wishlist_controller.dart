import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/dto/wishlist_brands_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ProductService productService = ProductService();   
  late TabController tabController;

  late RxList<ProductDto> allItems = <ProductDto>[].obs;
  late RxList<WishlistBrandsDto> boardsList = <WishlistBrandsDto>[].obs;

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
  }

  Future<void> fetchWishlistItems() async {
    final response = await productService.allFavorite();

    if (!response.error) {
      allItems.assignAll(response.data!);
    }
  }

  Future<void> fetchWishlistBrands() async {
    final response = await productService.allFavoriteBrands();

    if (!response.error) {
      boardsList.assignAll(response.data!);
    }
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
