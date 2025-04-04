import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_top_colletion.dart';
import 'package:e_commerce/widgets/row_text_with_showall.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardTopColletionSection extends GetView<DashboardController> {
  const DashboardTopColletionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.dashboardData.value.topCollections.isEmpty) {
        return const SizedBox.shrink();
      }
      return Column(
        children: [
          RowTextWithShowall(
            text: 'Top Collection',
            horizontal: MarginPadding.homeHorPadding,
          ),
          const DashboardTopColletion()
        ],
      );
    });
  }
}
