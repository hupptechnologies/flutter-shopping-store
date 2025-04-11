import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_back_or_favorite_button.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_image_change_circle.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_images.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_with_scrollable_sheet.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<ProductDetailController>(
      isLoader: controller.productService.api.isLoader,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ProductDetailImages(),
            ProductDetailBackOrFavoriteButton(),
            ProductDetailImageChangeCircle(),
            ProductDetailWithScrollableSheet(),
          ],
        ),
      ),
    );
  }
}
