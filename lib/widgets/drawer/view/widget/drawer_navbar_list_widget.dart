import 'package:e_commerce/widgets/drawer/controller/custom_drawer_controller.dart';
import 'package:e_commerce/widgets/drawer/view/widget/drawer_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerNavbarListWidget extends GetView<CustomDrawerController> {
  const DrawerNavbarListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(13),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        controller.navBarList.length,
        (index) {
          final item = controller.navBarList[index];
          final isSelected =
              item['index'] == controller.homeController.selectedIndex.value;
          return DrawerListItemWidget(
            title: item['title'],
            isSelected: isSelected,
            onTap: () {
              controller.homeController.changeTabIndex(item['index']);
              Get.back();
            },
            icon: item['icon'],
          );
        },
      ),
    );
  }
}
