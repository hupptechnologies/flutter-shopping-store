import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductDetailBackOrFavoriteButton
    extends GetView<ProductDetailController> {
  const ProductDetailBackOrFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MarginPadding.homeTopPadding * 2.5,
        left: MarginPadding.homeHorPadding,
        right: MarginPadding.homeHorPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BuildBackButton(),
          Obx(() {
            final product = controller.productDto.value;
            final isFavorite = product?.isFavorite ?? false;

            return FavoriteWidget(
              isFavorite: isFavorite,
              isBoxShadow: true,
              onPressed: controller.toggleFavorite,
            );
          }),
        ],
      ),
    );
  }
}
