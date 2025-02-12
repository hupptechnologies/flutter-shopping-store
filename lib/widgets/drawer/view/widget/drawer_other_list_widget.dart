import 'package:e_commerce/widgets/drawer/controller/custom_drawer_controller.dart';
import 'package:e_commerce/widgets/drawer/view/widget/drawer_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerOtherListWidget extends GetView<CustomDrawerController> {
  const DrawerOtherListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(13),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        controller.otherNavbarList.length,
        (index) {
          final item = controller.otherNavbarList[index];
          final isSelected = Get.currentRoute == item['path'];
          return DrawerListItemWidget(
            title: item['title'],
            isSelected: isSelected,
            onTap: () => controller.otherNavBarTap(item['path']),
            icon: item['icon'],
          );
        },
      ),
    );
  }
}
