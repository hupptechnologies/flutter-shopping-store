import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/accordion_text_icon.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailSimilarProduct extends GetView<ProductDetailController> {
  const ProductDetailSimilarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AccordionTextIcon(
      title: 'Similar Product',
      isExpanded: true,
      padding: MarginPadding.homeHorPadding,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children:
                  List.generate(controller.productDto.value!.similarProducts!.length, (index) {
                final item = controller.productDto.value!.similarProducts![index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? MarginPadding.homeHorPadding : 0,
                    right: MarginPadding.homeHorPadding,
                  ),
                  child: ProductCard(
                    name: item.name,
                    image: item.getImage,
                    width: 130,
                    price: item.price.toString(),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
