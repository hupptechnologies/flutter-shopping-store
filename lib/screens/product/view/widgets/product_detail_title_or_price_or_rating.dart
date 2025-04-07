import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductDetailTitleOrPriceOrRating
    extends GetView<ProductDetailController> {
  const ProductDetailTitleOrPriceOrRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 5),
      child: Column(
        spacing: 10,
        children: [
          Obx(
            () {
              final product = controller.productDto.value;
              final name = product?.name ?? 'N/A';
              final price = product?.price.toString() ?? 'N/A';

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
          const RatingWidget(
            value: 4.5,
            size: 20,
          ),
        ],
      ),
    );
  }
}
