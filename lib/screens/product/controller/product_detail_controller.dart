import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/data/product_dto.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  late DraggableScrollableController draggableScrollableController;
  late RxDouble size = (Get.height * 0.50).obs;

  late RxInt currentImage = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  late Rx<ProductDto> productDetail;
  late RxList<String> images = [
    ImageConstant.category1,
    ImageConstant.category2,
    ImageConstant.category3
  ].obs;
  late RxList<ProductDto> similarProducts;
  late RxList<String> colors;
  late RxList<Map<String, dynamic>> sizes = DummyData.sizes.obs;

  late RxSet<int> selectedColors = <int>{}.obs;
  late RxInt seletedSize = 0.obs;

  ProductDto get prodcut => productDetail.value;

  @override
  void onInit() {
    super.onInit();
    draggableScrollableController = DraggableScrollableController();

    draggableScrollableController.addListener(() {
      final getSize = draggableScrollableController.size + 0.02;
      size.value = (Get.height * getSize);
    });

    final id = Get.arguments['id'];
    final int parsedId = id is int ? id : int.parse(id.toString());
    productDetail = Rx<ProductDto>(findByIdProduct(parsedId));
  }

  void toggleFavorite() {
    productDetail.value.isFavorite = !prodcut.isFavorite;
    productDetail.refresh();
  }

  void changeImage(int index) {
    currentImage.value = index;
  }

  void toggleColor(int index) {
    if (selectedColors.contains(index)) {
      selectedColors.remove(index);
    } else {
      selectedColors.add(index);
    }
  }

  void toggleSize(int id) {
    seletedSize.value = seletedSize.value == id ? 0 : id;
  }

  void onTapAddToCart() {
    Get.toNamed(AppRoutes.cartList);
  }

  ProductDto findByIdProduct(int id) {
    final productList = productDtoFromJson(DummyData.productList);
    similarProducts = RxList<ProductDto>(productList);
    final product = productList.firstWhere(
      (item) => item.id == id,
      orElse: () => productList[0],
    );
    colors = RxList<String>(DummyData.colors.sublist(0, 3));
    return product;
  }
}
