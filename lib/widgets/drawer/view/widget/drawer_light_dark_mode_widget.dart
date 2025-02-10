import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
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
          final isDarkMode = controller.isDarkMode.value;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment:
                      isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 100,
                    height: 40,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacityValue(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    controller.themes.length,
                    (index) {
                      final item = controller.themes[index];
                      final isSelected =
                          controller.isDarkMode.value == item['isDark'];
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => controller.toggleTheme(item['isDark']),
                          child: Center(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                              child: Row(
                                key: ValueKey<bool>(isSelected),
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    item[isSelected ? 'selectedIcon' : 'icon'],
                                    color: isSelected
                                        ? Colors.black
                                        : AppColors.dartGratWithOpaity5,
                                  ),
                                  const SizedBox(width: 8),
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
