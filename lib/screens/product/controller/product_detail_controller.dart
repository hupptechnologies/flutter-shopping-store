import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/args/product_review_list_args.dart';
import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/dto/variant_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final ProductService productService = ProductService();

  late DraggableScrollableController draggableScrollableController;
  late RxDouble size = (Get.height * 0.50).obs;

  late RxInt currentImage = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  late Rxn<ProductDto> productDto = Rxn<ProductDto>();

  Rxn<String> selectedColor = Rxn<String>(null);
  Rxn<String> selectedSize = Rxn<String>(null);
  RxList<VariantDto> filteredColors = <VariantDto>[].obs;
  RxList<VariantDto> filteredSizes = <VariantDto>[].obs;

  @override
  void onInit() {
    super.onInit();
    draggableScrollableController = DraggableScrollableController();

    draggableScrollableController.addListener(() {
      final getSize = draggableScrollableController.size + 0.02;
      size.value = (Get.height * getSize);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final id = Get.arguments['id'];
      findByIdProduct(id.toString());
    });
  }

  void setColor(String color) {
    selectedColor.value = selectedColor.value == color ? null : color;
    filteredSizes.value = getFilteredSizes();
  }

  void setSize(String size) {
    selectedSize.value = selectedSize.value == size ? null : size;
    filteredColors.value = getFilteredColors();
  }

  List<VariantDto> getFilteredColors() {
    return _getUniqueVariants(
      filterValue: selectedSize.value,
      match: (v, val) => v.size == val,
      key: (v) => v.color,
    );
  }

  List<VariantDto> getFilteredSizes() {
    return _getUniqueVariants(
      filterValue: selectedColor.value,
      match: (v, val) => v.color == val,
      key: (v) => v.size,
    );
  }

  List<VariantDto> _getUniqueVariants({
    required String? filterValue,
    required bool Function(VariantDto, String) match,
    required String Function(VariantDto) key,
  }) {
    final variants = productDto.value?.variants ?? [];

    final filtered = filterValue == null
        ? variants
        : variants.where((v) => match(v, filterValue)).toList();

    final uniqueMap = <String, VariantDto>{};
    for (var variant in filtered) {
      uniqueMap[key(variant)] = variant;
    }

    return uniqueMap.values.toList();
  }

  Future<void> toggleFavorite() async {
    productDto.value!.isFavorite = !productDto.value!.isFavorite;
    final response = await productService.toggleFavorite(productDto.value!.id);
    if (!response.error) {
      findByIdProduct(productDto.value!.id.toString());
    }
  }

  void changeImage(int index) {
    currentImage.value = index;
  }

  void onTapAddToCart() {
    Get.toNamed(AppRoutes.cartList);
  }

  void onReviewList() {
    if (productDto.value != null && productDto.value!.totalRating! > 0) {
      Get.toNamed(
        AppRoutes.productReviews,
        arguments: ProductReviewListArgs(
          productId: productDto.value!.id,
          productName: productDto.value!.name,
        ),
      );
    }
  }

  Future<void> findByIdProduct(String id) async {
    final response = await productService.getById(id);
    if (!response.error) {
      productDto.value = response.data;
      filteredColors.value = getFilteredColors();
      filteredSizes.value = getFilteredSizes();
    }
  }
}
