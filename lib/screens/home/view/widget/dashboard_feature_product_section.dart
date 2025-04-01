import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard_feature_product_list.dart';
import 'package:e_commerce/widgets/row_text_with_showall.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class DashboardFeatureProductSection extends GetView<DashboardController> {
  const DashboardFeatureProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.dashboardData.value.featuredProducts.isEmpty) {
        return const SizedBox.shrink();
      }
      return Column(
        children: [
          RowTextWithShowall(
            text: 'Feature Products',
            horizontal: MarginPadding.homeHorPadding,
          ),
          const DashboardFeatureProductList(),
        ],
      );
    });
  }
}
