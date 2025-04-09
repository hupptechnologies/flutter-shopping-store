import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_add_to_cart_button.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_similar_product.dart';
import 'package:e_commerce/screens/product/view/widgets/product_detail_title_or_price_or_rating.dart';
import 'package:e_commerce/screens/product/view/widgets/product_details_color_or_size.dart';
import 'package:e_commerce/widgets/description_accordion.dart';
import 'package:e_commerce/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductDetailWithScrollableSheet
    extends GetView<ProductDetailController> {
  const ProductDetailWithScrollableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: controller.draggableScrollableController,
      initialChildSize: 0.48,
      maxChildSize: 0.6,
      minChildSize: 0.48,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacityValue(0.2),
                blurRadius: 4,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MarginPadding.homeHorPadding,
                        ),
                        child: Column(
                          children: [
                            const ProductDetailTitleOrPriceOrRating(),
                            const Divider(),
                            const ProductDetailsColorOrSize(),
                            const Divider(),
                            Obx(() {
                              final product = controller.productDto.value;
                              return DescriptionAccordion(
                                description: product?.description ?? "",
                              );
                            }),
                            const ReviewWidget(
                              ratings: [0, 3, 5, 12, 80],
                            ),
                          ],
                        ),
                      ),
                      Obx(() {
                        final similarProducts = controller.productDto.value?.similarProducts;
                        if (similarProducts == null || similarProducts.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return const ProductDetailSimilarProduct();
                      })
                    ],
                  ),
                ),
              ),
              const ProductDetailAddToCartButton()
            ],
          ),
        );
      },
    );
  }
}
