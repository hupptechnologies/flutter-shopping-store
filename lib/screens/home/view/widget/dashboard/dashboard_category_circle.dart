import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardCategoryCircle extends GetView<DashboardController> {
  const DashboardCategoryCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MarginPadding.homeHorPadding,
        right: MarginPadding.homeHorPadding,
        top: MarginPadding.homeHorPadding,
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(controller.categorys.length, (index) {
            final item = controller.categorys[index];
            bool isSelected = controller.categorySelectedIndex.value == index;

            return GestureDetector(
              onTap: () => controller.changeCategorySeletedIndex(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  Container(
                    padding:
                        isSelected ? const EdgeInsets.all(2) : EdgeInsets.zero,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                    ),
                    child: Container(
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.black : AppColors.lightGray,
                      ),
                      child: SvgPicture.asset(
                        item["image"]!,
                        color: isSelected ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                  Text(item["label"]!, style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
