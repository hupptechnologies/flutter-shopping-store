import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_recommended_list.dart';
import 'package:e_commerce/widgets/row_text_with_showall.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardRecommendedSection extends GetView<DashboardController> {
  const DashboardRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.dashboardData.value.recommendedProducts.isEmpty) {
        return const SizedBox.shrink();
      }
      return Column(
        children: [
          RowTextWithShowall(
            text: 'Recommended',
            horizontal: MarginPadding.homeHorPadding,
          ),
          const DashboardRecommendedList(),
        ],
      );
    });
  }
}