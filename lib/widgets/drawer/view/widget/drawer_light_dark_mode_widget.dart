import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/widgets/drawer/controller/custom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerLightDarkModeWidget extends GetView<CustomDrawerController> {
  const DrawerLightDarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: Obx(() {
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: List.generate(
                controller.themes.length,
                (index) {
                  final item = controller.themes[index];
                  final isSelected =
                      controller.isDarkMode.value == item['isDark'];
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => controller.toggleTheme(item['isDark']),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'],
                              color: isSelected
                                  ? Colors.black
                                  : AppColors.dartGratWithOpaity5,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              item['text'],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.black
                                    : AppColors.dartGratWithOpaity5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
