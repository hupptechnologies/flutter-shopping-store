import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/args/product_review_list_args.dart';
import 'package:e_commerce/common/requset/add_to_cart_req.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/cart_service.dart';
import 'package:e_commerce/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final ProductService productService = ProductService();
  final CartService cartService = CartService();
  final AddToCartReq addToCartReq = AddToCartReq();

  late DraggableScrollableController draggableScrollableController;
  late RxDouble size = (Get.height * 0.50).obs;

  late RxInt currentImage = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  late Rxn<ProductDto> productDto = Rxn<ProductDto>();

  @override
  void onInit() {
    super.onInit();
    draggableScrollableController = DraggableScrollableController();

    draggableScrollableController.addListener(() {
      final getSize = draggableScrollableController.size + 0.02;
      size.value = (Get.height * getSize);
    });

    final id = Get.arguments['id'];
    if (id != null) {
      addToCartReq.setProductId(id.toString());
      Future.microtask(() => findByIdProduct());
    }
  }

  Future<void> toggleFavorite() async {
    productDto.value!.isFavorite = !productDto.value!.isFavorite;
    final response = await productService.toggleFavorite(productDto.value!.id);

    if (response.error) return;
    findByIdProduct();
  }

  void changeImage(int index) {
    currentImage.value = index;
  }

  Future<void> onTapAddToCart() async {
    if (!addToCartReq.isValid) return;

    final response = await cartService.addToCart(addToCartReq);
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }

    CommonSnackbar.success(response.message);
    final result = await Get.toNamed(AppRoutes.cartList);

    if (result == true) {
      findByIdProduct();
    }
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

  Future<void> findByIdProduct() async {
    if (addToCartReq.productId == null) return;
    final response = await productService.getById(addToCartReq.productId!);

    if (!response.error) {
      productDto.value = response.data;
      addToCartReq.setVariants(response.data!.variants);
    }
  }
}
