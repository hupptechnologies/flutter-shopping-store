import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardFeatureProductList extends GetView<DashboardController> {
  const DashboardFeatureProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
              controller.dashboardData.value.featuredProducts.length, (index) {
            final item = controller.dashboardData.value.featuredProducts[index];
            return Padding(
              padding: EdgeInsets.only(
                right: index == controller.items.length - 1
                    ? MarginPadding.homeHorPadding
                    : 16,
                left: index == 0 ? MarginPadding.homeHorPadding : 0,
              ),
              child: InkWell(
                onTap: () => controller.gotoProductDetail(item.id),
                child: ProductCard(
                  name: item.name,
                  image: item.getImages,
                  price: item.price.toString(),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
